/*

 #####   #####    ####    #####   ####            ####
 #    #  #    #  #    #     #    #    #          #    #
 #    #  #    #  #    #     #    #    #          #
 #####   #####   #    #     #    #    #   ###    #
 #       #   #   #    #     #    #    #   ###    #    #
 #       #    #   ####      #     ####    ###     ####

	Protocol handling. Send requests and wait for answers.
*/

#include "config.h"
#include "portable.h"
#include <stdio.h>		/* For error reports -- FIXME */
#include <sys/types.h>
#include <sys/signal.h>
#include "request.h"
#include "rqst_idrs.h"
#include "com.h"
#include "stream.h"
#include "transfer.h"
#include "ewbio.h"
#include "stack.h"
#include "idrf.h"
#include "debug.h"
#include "except.h"
#include "server.h"
#include "interp.h"
#include "select.h"
#include "hector.h"
#include "bits.h"
#include "eiffel.h"

public int rqstcnt = 0;				/* Request count */
private char gc_stopped;

private void process_request();		/* Dispatch request processing */
private void inspect();				/* Object inspection */
private void adopt();				/* Adopt object */
private void access();				/* Access object through hector */
private void wean();				/* Wean adopted object */
private void load_bc();				/* Load byte code information */
private void obj_inspect();
private void bit_inspect();
private void string_inspect();		/* String object inspection */
private void once_inspect();		/* Once routines inspection */

private IDRF idrf;			/* IDR filter for serialize communications */

extern char *simple_out();	/* Out routine for simple time (from run-time) */

/*
 * IDR protocol initialization.
 */

public void prt_init()
{
	if (-1 == idrf_create(&idrf, IDRF_SIZE))
		fatal_error("cannot initialize streams");		/* Run-time routine */
}

/*
 * Handling requests.
 */

public void arqsthandle(s)
int s;
{
	/* Given a connected socket, wait for a request and process it. Since it
	 * is an error at the application level to not be able to receive a packet,
	 * recv_packet will exit via esdie() as soon as the connection is broken.
	 */
	
	Request rqst;		/* The request we are waiting for */

	Request_Clean (rqst); /* zero recognized as non initialized -- Didier */
	recv_packet(s, &rqst);		/* Get request */
	process_request(s, &rqst);	/* Process the received request */
}

private void process_request(s, rqst)
int s;						/* The connected socket */
Request *rqst;				/* The received request to be processed */
{
	/* Process the received request */

	STREAM *sp = stream_by_fd[s];

#define arg_1	rqst->rq_opaque.op_first
#define arg_2	rqst->rq_opaque.op_second
#define arg_3	rqst->rq_opaque.op_third

#ifdef USE_ADD_LOG
	add_log(9, "received request type %d", rqst->rq_type);
#endif

	switch (rqst->rq_type) {
	case INSPECT:					/* Object inspection */
		inspect(writefd (sp), &rqst->rq_opaque);
		break;
	case DUMP:						/* General stack dump request */
		send_stack(writefd (sp), arg_1);
		break;
	case MOVE:						/* Change active routine */
		dmove(arg_1);
		break;
	case BREAK:						/* Add/delete breakpoints */
		dsetbreak(arg_1, (uint32) arg_3, arg_2);
		break;
	case RESUME:					/* Resume execution */
		if (!gc_stopped) gc_run();
		dstatus(arg_1);				/* Debugger status (DX_STEP, DX_NEXT,..) */
#ifdef USE_ADD_LOG
		add_log(9, "RESUME");
		if ((void (*)()) 0 == rem_input(s))
			add_log(12, "rem_input: %s (%s)", s_strerror(), s_strname());
#else
		(void) rem_input(s);		/* Stop selection -> exit listening loop */
#endif
		break;
	case QUIT:						/* Die, immediately */
		esdie(0);
	case HELLO:							/* Initial handshake */
		send_ack(writefd(sp), AK_OK);	/* Ok, we're up */
		break;
	case KPALIVE:					/* Dummy request for connection checks */
		break;
	case LOAD:						/* Load byte code information */
		load_bc(arg_1, arg_2);
		break;
	case ADOPT:						/* Adopt object */
		adopt(writefd(sp), &rqst->rq_opaque);
		break;
	case ACCESS:					/* Access object through hector */
		access(writefd(sp), &rqst->rq_opaque);
		break;
	case WEAN:						/* Wean adopted object */
		wean(writefd(sp), &rqst->rq_opaque);
		break;
	case ONCE:						/* Once routines inspection */
		once_inspect(writefd (sp), &rqst->rq_opaque);
		break;
	}

#undef arg_1
#undef arg_2
#undef arg_3
}

/*
 * Sending requests - Receiving answers
 */

public void send_packet(s, rqst)
int s;				/* The connected socket */
Request *rqst;		/* The request to be sent */
{
	/* Sends an answer to the client */
	
	rqstcnt++;			/* One more request sent to daemon */
	idrf_pos(&idrf);	/* Reposition IDR streams */

	/* Serialize the request */
	if (!idr_Request(&idrf.i_encode, rqst)) {
#ifdef USE_ADD_LOG
		add_log(2, "ERROR unable to serialize request %d", rqst->rq_type);
#endif
		fprintf(stderr, "cannot serialize request, %d\n", rqst->rq_type);
		esdie(1);
	}

	/* Send the answer and propagate error report */
	if (-1 == net_send(s, idrs_buf(&idrf.i_encode), IDRF_SIZE)) {
#ifdef USE_ADD_LOG
		add_log(1, "SYSERR send: %m (%e)");
#endif
		fprintf(stderr, "cannot send request\n");
		signal (SIGABRT, SIG_DFL);
		signal (SIGQUIT, SIG_DFL);
		abort ();
	}

#ifdef DEBUG
	trace_request("sent", rqst);
#endif
}

public int recv_packet(s, dans)
int s;				/* The connected socket */
Request *dans;		/* The daemon's answer */
{
	/* Wait for an answer and fill in the Request structure, then de-serialize
	 * it. If an error occurs, exit immediately. The signature has to be 'int',
	 * since some shared functions do expect that signature. However, since
	 * no error recovery will be possible at the application level once the
	 * debugging link to ised is broken, it is wise to exit by calling esdie().
	 */
	
	/* Wait for request */
	if (-1 == net_recv(s, idrs_buf(&idrf.i_decode), IDRF_SIZE))
		esdie(1);		/* Connection lost, probably */

	idrf_pos(&idrf);	/* Reposition IDR streams */

	/* Deserialize request */
	if (!idr_Request(&idrf.i_decode, dans))
		esdie(1);

#ifdef DEBUG
	trace_request("got", dans);
#endif

	return 0;		/* All is ok, for lint */
}

/*
 * Protocol specific routines
 */

public void stop_rqst(s)
int s;
{
	/* Send a stop request, using the Where structure to give the program
	 * current location. We also indicate why the program stopped and set
	 * a proper exception tag if that is the reason we stopped.
	 */

	Request rqst;			/* XDR request built */
	struct where wh;		/* Where did the program stop? */

#define st_status	rq_stop.st_why
#define st_extag	rq_stop.st_tag
#define st_excode	rq_stop.st_code
#define st_wh		rq_stop.st_where

	gc_stopped = !gc_ison();
	gc_stop();

	Request_Clean (rqst);
	rqst.rq_type = STOPPED;				/* Stop request */
	rqst.st_status = d_cxt.pg_status;	/* Why we stopped */
	rqst.st_extag = "";			/* No exception tag by default */

	/* If we stopped because an exception has occurred, also give the
	 * exception code.
	 */
	switch (d_cxt.pg_status) {
	case PG_RAISE:						/* Explicitely raised exception */
	case PG_VIOL:						/* Implicitely raised exception */
		rqst.st_excode = echval;		/* Exception code */
		if (echtg != (char *) 0)		/* XDR might not like a null pointer */
			rqst.rq_stop.st_tag = echtg;	/* Exception tag computed */
		else
			rqst.rq_stop.st_tag = "";
	}

	ewhere(&wh);			/* Find out where we are */
	if (wh.wh_type == -1) {	/* Could not compute position */
		rqst.st_wh.wh_name = "Unknown";			/* Feature name */
		rqst.st_wh.wh_obj = (long) 0;			/* (char *) -> long for XDR */
		rqst.st_wh.wh_origin = 0;				/* Written where? */
		rqst.st_wh.wh_type = 0;					/* Dynamic type */
		rqst.st_wh.wh_offset = 0;				/* Offset in byte code */
	}
	else {
		rqst.st_wh.wh_name = wh.wh_name;		/* Feature name */
		rqst.st_wh.wh_obj = (long) wh.wh_obj;	/* (char *) -> long for XDR */
		rqst.st_wh.wh_origin = wh.wh_origin;	/* Written where? */
		rqst.st_wh.wh_type = wh.wh_type;		/* Dynamic type */
		rqst.st_wh.wh_offset = wh.wh_offset;	/* Offset in byte code */
	}

#undef st_status
#undef st_extag
#undef st_excode
#undef st_where

	send_packet(s, &rqst);	/* Send stopped notification */
}

private void inspect(s, what)
int s;
Opaque *what;		/* Generic structure describing request */
{
	/* Inspect an object and return its tagged out form back to ewb. The
	 * opaque structure describes the object we want. Note that the address
	 * is stored as a long, because XDR cannot pass pointers (without also
	 * sending the information referred to by this pointer).
	 */

	char *out;				/* Buffer where out form is stored */
	struct item *val;		/* Value in operational stack */
	char *addr;				/* Address of EIF_OBJ */


	switch (what->op_first) {		/* First value describes request */
	case IN_H_ADDR:					/* Hector address inspection */
		addr = (char *) what->op_third;		/* long -> (char *) */
		obj_inspect(&(eif_access((EIF_OBJ) addr)));
		return;
	case IN_BIT_ADDR:				/* Bit address inspection */
		addr = (char *) what->op_third;		/* long -> (char *) */
		bit_inspect((EIF_OBJ) &addr);
		return;
	case IN_STRING_ADDR:		/* String object inspection (hector addr) */
		addr = (char *) what->op_third;		/* long -> (char *) */
		string_inspect(&(eif_access((EIF_OBJ) addr)));
		return;
	case IN_ADDRESS:				/* Address inspection */
		addr = (char *) what->op_third;		/* long -> (char *) */
		out = dview((EIF_OBJ) &addr);
		break;
	case IN_LOCAL:					/* Local inspection */
		val = ivalue(IV_LOCAL, what->op_second);
		break;
	case IN_ARG:					/* Argument inspection */
		val = ivalue(IV_ARG, what->op_second);
		break;
	case IN_CURRENT:				/* Value of Current */
		val = ivalue(IV_CURRENT);
		break;
	case IN_RESULT:					/* Value of Result */
		val = ivalue(IV_RESULT);
		break;
	default:
		panic("BUG inspect");
	}

	if (what->op_first != IN_ADDRESS)	/* Not an address request */
		out = simple_out(val);			/* May be a simple type */

	/* Now we got a string, holding the appropriate representation of the
	 * object. Send it to the remote process verbatim and free it.
	 */

	twrite(out, strlen(out));
	free(out);
}

private void once_inspect(s, what)
int s;				/* The connected socket */
Opaque *what;		/* Generic structure describing request */
{
	/* Check whether a once routine has already been called. In this case
	 * its result may be ask by ewb.
	 */

	int arg_num;
	uint32 body_id = (uint32) what->op_third;	/* Body_id of once routine */

	switch (what->op_first) {		/* First value describes request */
	case OUT_CALLED:				/* Has once routine already been called? */
		if (onceitem(body_id) != (uint32 *)0)	/* body_id found in once list*/
			twrite("true", 4);
		else
			twrite("false", 5);
		break;
	case OUT_RESULT:			/* Result of already called once function */
		arg_num = what->op_second;	/* Number of arguments to be passed */
		send_once_result(s, body_id, arg_num);	/* Send result back to ewb */
		break;
	default:
		panic("BUG once inspect");
	}
}

private void adopt(s, what)
int s;
Opaque *what;		/* Generic structure describing request */
{
	/* Adopt an object and return its hector address back to ewb. The
	 * opaque structure describes the object. Note that the address
	 * is stored as a long, because XDR cannot pass pointers (without also
	 * sending the information referred to by this pointer).
	 */

	char *physical_addr;	/* Address of unprotected object */
	char hector_addr[20];	/* Buffer where indirection address is stored */
	char *result;			/* Eiffel string */

	physical_addr = (char *) what->op_third;
	sprintf(hector_addr, "0x%lX", eif_adopt((EIF_OBJ) &physical_addr));
	twrite(hector_addr, strlen(hector_addr));
}

private void access(s, what)
int s;
Opaque *what;		/* Generic structure describing request */
{
	/* Access an object through hector and return its physical address 
	 * back to ewb. The opaque structure describes the object. Note 
	 * that the address is stored as a long, because XDR cannot pass 
	 * pointers (without also sending the information referred to by 
	 * this pointer).
	 */

	char physical_addr[20];	/* Address of unprotected object */
	char *hector_addr;		/* Hector address with indirection */
	
	hector_addr = (char *) what->op_third;
	sprintf(physical_addr, "0x%lX", eif_access((EIF_OBJ) hector_addr));
	twrite(physical_addr, strlen(physical_addr));
}

private void wean(s, what)
int s;
Opaque *what;		/* Generic structure describing request */
{
	/* Wean an adopted object. The opaque structure describes the object.
	 * Note that the address is stored as a long, because XDR cannot pass 
	 * pointers (without also sending the information referred to by 
	 * this pointer).
	 */

	char *hector_addr;		/* Hector address with indirection */
	
	hector_addr = (char *) what->op_third;
	eif_wean((EIF_OBJ) hector_addr);
}

private void load_bc(slots, amount)
int slots;		/* Number of new slots needed in the melting table */
int amount;		/* Amount of byte codes to be downloaded */
{
	/* Upon receiving a LOAD request, the application attempts to download the
	 * byte code from the compiler. The 'slots' parameters indicates the amount
	 * of new slots for the melting table, so that we can pre-extend it once
	 * and for all. An acknowledgment is then sent back. If that extension
	 * succeeeded, we attempt to load each byte code, one by one, punctuating
	 * each loading with an acknowledgment. We stop as soon as there is an
	 * error, of course.
	 */

	STREAM *sp = stream_by_fd[EWBOUT];
	Request rqst;				/* Loading BYTECODE request */
	char *bc;					/* Location of loaded byte code */
	int s = writefd(sp);		/* Writing "socket" */
	int r = readfd(sp);			/* Reading "socket" */
	int i;

	Request_Clean (rqst);
	if (-1 == dmake_room(slots)) {		/* Extend melting table */
		send_ack(s, AK_ERROR);			/* Notify failure */
		return;							/* Abort procedure */
	} else
		send_ack(s, AK_OK);				/* Extension succeeded */

#define arg_1	rqst.rq_opaque.op_first
#define arg_2	rqst.rq_opaque.op_second

	/* The byte codes have a BYTECODE leading request giving the body index
	 * and body ID information, which is followed by a transfer request to
	 * download the byte code itself.
	 */

	for (i = 0; i < amount; i++) {		/* Now loop to get all byte codes */
		recv_packet(r, &rqst);			/* Read BYTECODE request */
		if (rqst.rq_type != BYTECODE) {	/* Wrong request */
			send_ack(s, AK_PROTO);		/* Protocol error */
			return;
		}
		bc = tread((int *) 0);			/* Get byte code in memory */
		if (bc == (char *) 0) {			/* Not enough memory */
			send_ack(s, AK_ERROR);		/* Notify failure */
			return;						/* And abort downloading */
		}
		drecord_bc(arg_1, arg_2, bc);	/* Place byte code in run-time tables*/
		send_ack(s, AK_OK);				/* Byte code loaded successfully */
	}

#undef arg_1
#undef arg_2
}


/*
 *		Routines for inspecting an Eiffel object.
 */

#define BUF_SIZE 512
private char buffer[BUF_SIZE];

private void rec_inspect();
private void rec_sinspect();

private void obj_inspect(object)
EIF_OBJ object;
{
	uint32 flags;		/* Object flags */

	flags = HEADER(eif_access(object))->ov_flags;

	if (flags & EO_SPEC) {
		/* Special object */
		sprintf(buffer, "%s", "SPECIAL");
		twrite (buffer, strlen(buffer));
		sprintf(buffer, "0x%lX", eif_access(object));
		twrite (buffer, strlen(buffer));
		/* Send items recursively */
		rec_sinspect(eif_access(object));
	} else {
		/* Send instance class name and object id */
		sprintf(buffer, "%s", System(flags & EO_TYPE).cn_generator);
		twrite (buffer, strlen(buffer));
		sprintf(buffer, "0x%lX", eif_access(object));
		twrite (buffer, strlen(buffer));
		/* Inspect recursively `object' */
		rec_inspect(eif_access(object));
	}
}

private void rec_inspect(object)
register1 char *object;
{
	/* Inspect recursively `object''s attribute */

	register2 struct cnode *obj_desc;		/* Object type description */
	register3 long nb_attr;					/* Attribute number */
	register4 uint32 *types;				/* Attribute types */
#ifndef WORKBENCH
	register6 long **offsets;				/* Attribute offsets table */
#else
	register4 int32 *cn_attr;				/* Attribute keys */
	long offset;
#endif
	register5 int16 dyn_type;				/* Object dynamic type */
	char *o_ref;
	register7 char **names;					/* Attribute names */
	char *reference;						/* Reference attribute */
	char *refptr;
	union overhead *zone;
	long i,nb_old, nb_reference;
	uint32 type, ref_flags;

	dyn_type = Dtype(object);
	obj_desc = &System(dyn_type);
	nb_attr = obj_desc->cn_nbattr;
	names = obj_desc->cn_names;
	types = obj_desc->cn_types;

#ifndef WORKBENCH
	offsets = obj_desc->cn_offsets;
#else
	cn_attr = obj_desc->cn_attr;
#endif

	/* Send the attribute number */
	sprintf(buffer, "%ld", nb_attr);
	twrite (buffer, strlen(buffer));

	for (i = 0; i < nb_attr; i++) {

		/* Send attribute name */
		sprintf(buffer, "%s", names[i]);
		twrite (buffer, strlen(buffer));

		/* Send attribute value */
		type = types[i];
#ifndef WORKBENCH
		o_ref = object + (offsets[i])[dyn_type];
#else
		CAttrOffs(offset,cn_attr[i],dyn_type);
		o_ref = object + offset;
#endif
		switch(type & SK_HEAD) {
		case SK_POINTER:
			/* Pointer attribute */
			sprintf(buffer, "POINTER");
			twrite (buffer, strlen(buffer));
			sprintf(buffer, "0x%lX", *(fnptr *)o_ref);
			twrite (buffer, strlen(buffer));
			break;
		case SK_BOOL:
			/* Boolean attribute */
			sprintf(buffer, "BOOLEAN");
			twrite (buffer, strlen(buffer));
			sprintf(buffer, "%s", (*o_ref ? "True" : "False"));
			twrite (buffer, strlen(buffer));
			break;
		case SK_CHAR:
			/* Character attribute */
			sprintf(buffer, "CHARACTER");
			twrite (buffer, strlen(buffer));
			sprintf(buffer, "%d", *o_ref);
			twrite (buffer, strlen(buffer));
			break;
		case SK_INT:
			/* Integer attribute */
			sprintf(buffer, "INTEGER");
			twrite (buffer, strlen(buffer));
			sprintf(buffer, "%ld", *(long *)o_ref);
			twrite (buffer, strlen(buffer));
			break;
		case SK_FLOAT:
			/* Real attribute */
			sprintf(buffer, "REAL");
			twrite (buffer, strlen(buffer));
			sprintf(buffer, "%g", *(float *)o_ref);
			twrite (buffer, strlen(buffer));
			break;
		case SK_DOUBLE:
			/* Double attribute */
			sprintf(buffer, "DOUBLE");
			twrite (buffer, strlen(buffer));
			sprintf(buffer, "%.17g", *(double *)o_ref);
			twrite (buffer, strlen(buffer));
			break;	
		case SK_BIT:
			sprintf(buffer, "BIT");
			twrite (buffer, strlen(buffer));
			{
				char *str = b_out(o_ref);
				sprintf(buffer, "%s", str);
				twrite (buffer, strlen(buffer));
				xfree(str);
			}
			break;	
		case SK_EXP:
			/* Expanded attribute */
			sprintf(buffer, "expanded");
			twrite (buffer, strlen(buffer));
			sprintf(buffer, "%s", System(Dtype(o_ref)).cn_generator);
			twrite (buffer, strlen(buffer));
			rec_inspect((char *)o_ref);
			break;
		default: 
			/* Object reference */
			reference = *(char **)o_ref;
			if (0 != reference) {
				ref_flags = HEADER(reference)->ov_flags;
				if (ref_flags & EO_C) {
					sprintf(buffer, "POINTER");
					twrite (buffer, strlen(buffer));
					sprintf(buffer, "0x%lX", reference);
					twrite (buffer, strlen(buffer));
				} else if (ref_flags & EO_SPEC) {
					/* Special object */
					sprintf(buffer, "SPECIAL");
					twrite (buffer, strlen(buffer));
					sprintf(buffer, "0x%lX", reference);
					twrite (buffer, strlen(buffer));
					rec_sinspect (reference);
				} else {
					sprintf(buffer, "%s",System(Dtype(reference)).cn_generator);
					twrite (buffer, strlen(buffer));
					sprintf(buffer, "0x%lX", reference);
					twrite (buffer, strlen(buffer));
				}
			} else {
				sprintf(buffer, "%s", System(type & SK_DTYPE).cn_generator);
				twrite (buffer, strlen(buffer));
				sprintf(buffer, "Void");
				twrite (buffer, strlen(buffer));
			}
		}
	}
}

private void rec_sinspect(object)
register1 char *object;
{
	/* Inspect special object */

	union overhead *zone;		/* Object header */
	register5 uint32 flags;		/* Object flags */
	register3 long count;		/* Element count */
	register4 long elem_size;	/* Element size */
	char *o_ref;
	char *reference, *bit;
	long old_count;
	int dt_type;

	zone = HEADER(object);
	o_ref = (char *) (object + (zone->ov_size & B_SIZE) - LNGPAD(2));
	count = *(long *) o_ref;
	old_count = count;
	elem_size = *(long *) (o_ref + sizeof(long));
	flags = zone->ov_flags;
	dt_type = (int) (flags & EO_TYPE);

	
	/* Send the item number */
	sprintf(buffer, "%ld", count);
	twrite (buffer, strlen(buffer));

	if (!(flags & EO_REF)) 
		if (flags & EO_COMP) 
			for (o_ref = object + OVERHEAD; count > 0; count--,
						o_ref += elem_size) {
				sprintf(buffer, "%ld", old_count - count);
				twrite (buffer, strlen(buffer));
				sprintf(buffer, "expanded");
				twrite (buffer, strlen(buffer));
				sprintf(buffer, "%s", System(Dtype(o_ref)).cn_generator);
				twrite (buffer, strlen(buffer));
				rec_inspect(o_ref);
			}
		else
			for (o_ref = object; count > 0; count--,
						o_ref += elem_size) {
				sprintf(buffer, "%ld", old_count - count);
				twrite (buffer, strlen(buffer));
				if (dt_type == sp_char) {
					sprintf(buffer, "CHARACTER");
					twrite (buffer, strlen(buffer));
					sprintf(buffer, "%d", *o_ref);
					twrite (buffer, strlen(buffer));
				} else if (dt_type == sp_int) {
					sprintf(buffer, "INTEGER");
					twrite (buffer, strlen(buffer));
					sprintf(buffer, "%ld", *(long *)o_ref);
					twrite (buffer, strlen(buffer));
				} else if (dt_type == sp_bool) {
					sprintf(buffer, "BOOLEAN");
					twrite (buffer, strlen(buffer));
					sprintf(buffer, "%s", (*o_ref ? "True" : "False"));
					twrite (buffer, strlen(buffer));
				} else if (dt_type == sp_real) {
					sprintf(buffer, "REAL");
					twrite (buffer, strlen(buffer));
					sprintf(buffer, "%g", *(float *)o_ref);
					twrite (buffer, strlen(buffer));
				} else if (dt_type == sp_double) {
					sprintf(buffer, "DOUBLE");
					twrite (buffer, strlen(buffer));
					sprintf(buffer, "%.17g", *(double *)o_ref);
					twrite (buffer, strlen(buffer));
				} else if (dt_type == sp_pointer) {
					sprintf(buffer, "POINTER");
					twrite (buffer, strlen(buffer));
					sprintf(buffer, "0x%lX", *(fnptr *)o_ref);
					twrite (buffer, strlen(buffer));
				} else {
					/* Must be bit */
					sprintf(buffer, "BIT");
					twrite (buffer, strlen(buffer));
					sprintf(buffer, "%s", b_out(*(char **)o_ref));
					twrite (buffer, strlen(buffer));
				}
			}
	else 
		for (o_ref = object; count > 0; count--,
					o_ref = (char *) ((char **)o_ref + 1)) {
			sprintf(buffer, "%ld", old_count - count);
			twrite (buffer, strlen(buffer));
			reference = *(char **)o_ref;
			if (0 == reference) {
				sprintf(buffer, "Void");
				twrite (buffer, strlen(buffer));
					/* Send "Void" twice: one for the type and */
					/* the other for the value of the item. */
				twrite (buffer, strlen(buffer));
			} else if (HEADER(reference)->ov_flags & EO_C) {
				sprintf(buffer, "POINTER");
				twrite (buffer, strlen(buffer));
				sprintf(buffer, "0x%lX", reference);
				twrite (buffer, strlen(buffer));
			} else {
				sprintf(buffer, "%s", System(Dtype(reference)).cn_generator);
				twrite (buffer, strlen(buffer));
				sprintf(buffer, "0x%lX", reference);
				twrite (buffer, strlen(buffer));
			}
		}
}

private void bit_inspect(object)
EIF_OBJ object;		/* Reference to a bit object (= BIT_REF) */
{
	sprintf(buffer, "%s", b_out(*(char **)object));
	twrite (buffer, strlen(buffer));
}

private void string_inspect(object)
EIF_OBJ object;		/* Reference to a string object */
{
		/* Inspect the string object to get the string value */

	register2 struct cnode *obj_desc;		/* Object type description */
	register3 long nb_attr;					/* Attribute number */
	register4 int32 *cn_attr;				/* Attribute keys */
	long offset;
	register5 int16 dyn_type;				/* Object dynamic type */
	char *o_ref;
	register7 char **names;					/* Attribute names */
	char *reference;
	long i, string_count = 0;
	char *string_area;

	reference = eif_access(object);
	dyn_type = Dtype(reference);
	obj_desc = &System(dyn_type);
	nb_attr = obj_desc->cn_nbattr;
	names = obj_desc->cn_names;
	cn_attr = obj_desc->cn_attr;

	for (i = 0; i < nb_attr; i++) {
		CAttrOffs(offset,cn_attr[i],dyn_type);
		o_ref = reference + offset;
		if (strcmp(names[i], "count") == 0) {
			string_count = *(long *) o_ref;
		} else if (strcmp(names[i], "area") == 0) {
			string_area = *(char **) o_ref;
		}
	}
	twrite (string_area, string_count);
}

/*
 *   compress.c
 *
 *   Abstract: compression - decompression algorithm
 *
 *   Author: Hubert Divoux
 *
 *   Copyright (c) 1996, Interactive Software Engineering Inc.
 *   All rights reserved.
 *
 */


/*

Compression - decompression algorithm description 
-------------------------------------------------

The aim of the compression - decompression algorithm is to compress a 
sequence of octets into another (usually shorter) sequence of octets.
The algorithm is based and adapted to the fact that at least a great 
proportion of octets within an input sequence are null (equal to 0x00).
This property is verified for the sequences of octets corresponding to 
the files generated by the compiler in the sub directory "comp" (these 
files are in the basic store format).

The algorithm's principle is simple: 
- Each null octet is replaced by a bit at 0.
- Each non null octet is replaced by a bit at 1 immediately followed by the 
eight bits of the octet.

For an input sequence of n octets containing m null octets, the 
compression rate is given approximately by the formula:

r = m / n - 1 / 8

Obviously this simple algorithm really compress if m > n / 8. The 
implementation ensure that this is verified. If it is not, the input 
sequence is not compressed and simply recopied in the output sequence. 

Six octets are always reserved at the head of an output sequence. The 
first one is used to indicate if an output sequence is compressed or 
not. The next fours contain an integer equal to the number of compressed 
octets in an output sequence (excluding the six head octets). The last 
one contains the number of bits at 0 (padding bits) added at the end of 
the last octet of an output sequence (these bits are possibly required 
to complete the octet).

Mapping of an output sequence:

    |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  | ...
    <----->
  compression
   indicator
          <----------------------->
             number of compressed
                    octets
                                  <----->
                                 number of 
                                padding bits
<---------------------------------------><----------------------------->
                 head                      octets corresponding to the 
                                            compressed input sequence



The compression indicator octet can take two values: EIF_CMPS_DIS_CMPS
(0x01) or EIF_CMPS_DIS_NO_CMPS (0x00). Only the lower bit is really 
used. The others are reserved for a future use.

Example: 

input sequence (hexadecimal) =
{0xAB 0x45 0x00 0x24 0x00 0x00 0x00 0x00 0x00 0xDF}

output sequence (binary) = 
{1|1010|1011|1|0100|0101|0|1|0010|0100|0|0|0|0|0|1|1101|1111|000000}

output sequence (binary) =
{1101|0101|1101|0001|0101|0010|0100|0000|0111|0111|1100|0000}

output sequence (hexadecimal) =
{0xD5 0xD1 0x52 0x40 0x77 0xC0}

The output sequence doesn't include the five head octets to ease 
clearness. In this example there are six padding bits.

*/

/*#define DEBUG_CMPS*/

#include <stdio.h>
#ifndef VXWORKS
#include <memory.h>
#endif
#ifdef DEBUG_CMPS
#include "eif_confmagic.h"
#include <assert.h>
#endif
#include "rt_compress.h"

rt_public void eif_cmps_read_u32_from_char_buf (unsigned char* in_buf, uint32* pout_value);
rt_private void eif_cmps_write_u32_to_char_buf (uint32 in_value, unsigned char* out_buf);

/*
 *	eif_compress
 *
 *	Abstract: compression algorithm implementation
 *
 *	[in] in_buf: input buffer
 *	[in] in_size: input buffer number of significant octets
 *
 *	[out] out_buf: output buffer
 *	[out] pout_size: output size (not including the head octets) reference
 *
 */

rt_public void eif_compress (unsigned char* in_buf, unsigned long in_size, unsigned char* out_buf, unsigned long* pout_size)
{
	unsigned char* in_ptr = NULL;
	unsigned char* out_ptr = NULL;
	register unsigned char in_octet = 0x00;
	register unsigned char out_octet = 0x00;
	register int i = 0;
	short bit_nb = 0;
	unsigned long out_size = 0;
	unsigned short pad_size = 0;

#ifdef DEBUG_CMPS
	assert (in_buf != NULL);
	assert (in_size <= EIF_CMPS_IN_SIZE);
	assert (out_buf != NULL);
	assert (pout_size != NULL);
	assert (p_out_size >= ((in_size * 9) / 8 + 1 + EIF_CMPS_HEAD_SIZE));
#endif

	in_ptr = in_buf;
	out_ptr = out_buf;
	out_ptr += EIF_CMPS_HEAD_SIZE;
	bit_nb = 7;

	for (i = 0; i < (long)in_size; i ++) {
			/* UMR from Purify on the compiler!!!! */
		in_octet = *in_ptr;
		if (in_octet == 0x00) {
			if (bit_nb == 0) {
				*out_ptr ++ = out_octet;
				out_octet = 0x00;
				bit_nb = 7;
			} else {
				bit_nb --;
			}
		} else {
			out_octet |= 1 << bit_nb;
			if (bit_nb == 0) {
				*out_ptr ++ = out_octet;
				out_octet = in_octet;
				*out_ptr ++ = out_octet;
				out_octet = 0x00;
				bit_nb = 7;
			} else {
				out_octet |= in_octet >> (8 - bit_nb);
				*out_ptr ++ = out_octet;
				out_octet = in_octet << bit_nb;
				bit_nb --;
			}
		}
		in_ptr ++;
	}

	if (bit_nb != 7) { /* padding */
		*out_ptr ++ = out_octet;
		pad_size = bit_nb + 1;
	}

	out_size = (unsigned long)(out_ptr - (out_buf + EIF_CMPS_HEAD_SIZE));

	if (out_size + EIF_CMPS_HEAD_SIZE <= in_size) { /* compression effective -> output buffer compressed */
		out_ptr = out_buf;
		*out_ptr = EIF_CMPS_DIS_CMPS;
	} else { /* compression ineffective -> output buffer not compressed */
		out_size = in_size;
		pad_size = 0;
		in_ptr = in_buf;
		out_ptr = out_buf + EIF_CMPS_HEAD_SIZE;
		memcpy (out_ptr, in_ptr, in_size);
		out_ptr = out_buf;
		*out_ptr = EIF_CMPS_DIS_NO_CMPS;
	}

	out_ptr += EIF_CMPS_HEAD_DIS_SIZE;
	eif_cmps_write_u32_to_char_buf (out_size, out_ptr);
	out_ptr += EIF_CMPS_HEAD_OUT_SIZE;
	*out_ptr = (unsigned char)pad_size;
	*pout_size = out_size;

#ifdef DEBUG_CMPS
	assert (out_size + EIF_CMPS_HEAD_SIZE <= EIF_CMPS_OUT_SIZE);
	assert (pad_size <= 7);
#endif
}


/*
 *	eif_decompress
 *
 *	Abstract: decompression algorithm implementation
 *
 *	[in] in_buf: input buffer
 *	[in] in_size: input buffer number of significant octets (not including the head octets)
 *
 *	[out] out_buf: output buffer
 *	[out] pout_size: output size reference
 *
 */

void eif_decompress (unsigned char* in_buf, unsigned long in_size, unsigned char* out_buf, unsigned long* pout_size)
{
	unsigned char* in_ptr = NULL;
	unsigned char* out_ptr = NULL;
	register unsigned char in_octet = 0x00;
	register unsigned char out_octet = 0x00;
	register int i = 0;
	unsigned char discriminator = 0x00;
	short bit_nb = 0;
	unsigned long out_size = 0;
	unsigned short pad_size = 0;
	short not_stop = 0;
	short state_octet = 0;

#ifdef DEBUG_CMPS
	uint32 out_value = 0;

	assert (in_buf != NULL);
	assert (in_size + EIF_CMPS_HEAD_SIZE <= EIF_DCMPS_IN_SIZE);
	assert (out_buf != NULL);
	assert (pout_size != NULL);
	eif_cmps_read_u32_from_char_buf (in_buf + EIF_CMPS_HEAD_DIS_SIZE, &out_value);
	assert (in_size == out_value);
	assert ((unsigned short)*(in_buf + EIF_CMPS_HEAD_DIS_SIZE + EIF_CMPS_HEAD_OUT_SIZE) <= 7);
#endif

	in_ptr = in_buf;
	discriminator = *in_ptr;
	in_ptr += EIF_CMPS_HEAD_DIS_SIZE + EIF_CMPS_HEAD_OUT_SIZE;
	pad_size = (unsigned short)*in_ptr;
	in_ptr = in_buf + EIF_CMPS_HEAD_SIZE;
	out_ptr = out_buf;
	bit_nb = 7;

	if (discriminator == EIF_CMPS_DIS_CMPS) { /* input buffer compressed */
		for (i = 0; i < (long)in_size; i ++) {
			in_octet = *in_ptr;
			not_stop = 1;
			while (not_stop) {
				if (state_octet) {
					out_octet |= in_octet >> bit_nb;
					*out_ptr ++ = out_octet;
					out_octet = 0x00;
					bit_nb --;
					if (bit_nb < 0) {
						bit_nb = 7;
						not_stop = 0;
					}
					state_octet = 0;
				} else {
					if (in_octet & 0x01 << bit_nb) {
						state_octet = 1;
						out_octet = in_octet << (8 - bit_nb);
						not_stop = 0;
					} else {
						*out_ptr ++ = 0x00;
						bit_nb --;
						if (bit_nb < 0) {
							bit_nb = 7;
							not_stop = 0;
						}
					}
				}
			}
			in_ptr ++;
		}
		
		out_size = (unsigned long)(out_ptr - out_buf);
		out_size -= pad_size; /* padding */
		*pout_size = out_size;
	} else { /* input buffer not compressed */
		memcpy ((void*)out_ptr, (void*)in_ptr, in_size);
		*pout_size = in_size;
	}

#ifdef DEBUG_CMPS
	assert (out_size + pad_size <= EIF_DCMPS_OUT_SIZE);
#endif
}

/*
 *	eif_cmps_read_u32_from_char_buf
 *
 *	Abstract: read a 32 bits unsigned integer from a buffer of characters (implementation independent)
 *
 *	[in] in_buf: input buffer
 *
 *	[out] pout_value: output value reference
 *
 */

rt_public void eif_cmps_read_u32_from_char_buf (unsigned char* in_buf, uint32* pout_value)
{
#ifdef DEBUG_CMPS
 	assert (in_buf != NULL);
	assert (pout_value != NULL);
#endif

	*pout_value = (uint32)*in_buf << 24;
	*pout_value |= (uint32)*(in_buf + 1) << 16;
	*pout_value |= (uint32)*(in_buf + 2) << 8;
	*pout_value |= (uint32)*(in_buf + 3);
}

/*
 *	eif_cmps_write_u32_to_char_buf
 *
 *	Abstract: write a 32 bits unsigned integer to a buffer of characters (implementation independent)
 *
 *	[in] in_value: input value
 *
 *	[out] out_buf: output buffer
 *
 */

rt_private void eif_cmps_write_u32_to_char_buf (uint32 in_value, unsigned char* out_buf)
{
#ifdef DEBUG_CMPS
	assert (out_buf != NULL);
#endif

	*out_buf = (unsigned char)(in_value >> 24);
	*(out_buf + 1) = (unsigned char)(in_value >> 16);
	*(out_buf + 2) = (unsigned char)(in_value >> 8);
	*(out_buf + 3) = (unsigned char)in_value;
}


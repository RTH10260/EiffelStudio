/*
	description: "[
			A console implementation for Win32.
			The default console in Win32 will not provide any details such as how the
			window was started or anything for a graphical application.
			This console will run with either a graphical application or a console
			application.
			]"
	date:		"$Date$"
	revision:	"$Revision$"
	copyright:	"Copyright (c) 1985-2006, Eiffel Software."
	license:	"GPL version 2 see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options:	"Commercial license is available at http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Runtime.
			
			Eiffel Software's Runtime is free software; you can
			redistribute it and/or modify it under the terms of the
			GNU General Public License as published by the Free
			Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Runtime is distributed in the hope
			that it will be useful,	but WITHOUT ANY WARRANTY;
			without even the implied warranty of MERCHANTABILITY
			or FITNESS FOR A PARTICULAR PURPOSE.
			See the	GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Runtime; if not,
			write to the Free Software Foundation, Inc.,
			51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA
		]"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"
*/

#include <stdio.h>
#include <windows.h>
#include "eif_argcargv.h"
#include "rt_err_msg.h"
#include "rt_error.h"
#include "eif_posix_threads.h"
#include "rt_dir.h"
#include "rt_main.h"
#include <io.h>
#include <fcntl.h>

#ifdef WORKBENCH
#include "rt_main.h"	/* For `debug_mode' */
#endif

static BOOL eif_console_allocated = FALSE;

#ifdef EIF_THREADS
rt_private EIF_MUTEX_TYPE *eif_exception_trace_mutex = (EIF_MUTEX_TYPE *) 0;
#endif

rt_public void eif_show_console(void);					/* Show the DOS console if needed */

int print_err_msg (FILE *err, char *StrFmt, ...)
{
	va_list ap;
	int r;
	FILE *exception_saved;
	char saved_cwd [PATH_MAX + 1];

	eif_show_console ();

		/* Write error to `err'. */
	va_start (ap, StrFmt);
	r = vfprintf (err, StrFmt, ap);
	va_end (ap);

		/* Now try to write error into `exception_trace.log' file */
#ifdef EIF_THREADS
		/* FIXME: This is not thread safe at all. */
	if (!eif_exception_trace_mutex) {
		RT_TRACE(eif_pthread_mutex_create(&eif_exception_trace_mutex));
	}

	if (eif_exception_trace_mutex) {
		RT_TRACE(eif_pthread_mutex_lock(eif_exception_trace_mutex));
	}
#endif

	getcwd(saved_cwd, PATH_MAX);
	chdir (starting_working_directory);

		/* If we are not allowed to write the exception, we don't do it */
	if ((exception_saved = fopen( "exception_trace.log", "at" )) != NULL) {
		va_start (ap, StrFmt);
		r = vfprintf (exception_saved, StrFmt, ap);
		va_end (ap);
		fclose (exception_saved);
	}
	chdir (saved_cwd);

#ifdef EIF_THREADS
	if (eif_exception_trace_mutex) {
		RT_TRACE(eif_pthread_mutex_unlock(eif_exception_trace_mutex));
	}
#endif
	return r;
}

void eif_console_cleanup (EIF_BOOLEAN crashed)
	/* Free the DOS console */
	/* If crashed = EIF_TRUE then a message is shown to the user so that he
	 * can see what has been the problem after a crash of his system */
{
	BOOL b;

	if (eif_console_allocated) {
#ifdef EIF_THREADS
		if (eif_thr_is_root())
#endif
		{
#ifdef WORKBENCH
			if (debug_mode) {
				EIF_CHARACTER_8 c;
				printf ("\nPress Return to finish the execution...");
				fflush(stdout);
				scanf ("%c", &c);
			}
#endif
			b = FreeConsole ();
		}
		eif_console_allocated = FALSE;
	}  
}

/* 
 * Console mutex in MT mode. 
 */
#ifdef EIF_THREADS
/*
doc:	<attribute name="eif_console_mutex" return_type="EIF_CS_TYPE *" export="shared">
doc:		<summary>To protect multithreaded access to `eif_console_allocated'.</summary>
doc:		<thread_safety>Safe</thread_safety>
doc:	</attribute>
*/
rt_shared EIF_CS_TYPE *eif_console_mutex = (EIF_CS_TYPE *) 0;

#define EIF_CONSOLE_LOCK EIF_ASYNC_SAFE_CS_LOCK(eif_console_mutex)
#define EIF_CONSOLE_UNLOCK EIF_ASYNC_SAFE_CS_UNLOCK(eif_console_mutex)

#else	/* EIF_THREADS */

#define EIF_CONSOLE_LOCK
#define EIF_CONSOLE_UNLOCK

#endif	/* EIF_THREADS */

rt_public void eif_show_console(void)
	/* Create a new DOS console if needed (i.e. in case of a Windows application. */
{
	if (!eif_console_allocated) {
		HANDLE eif_conin, eif_conout, eif_conerr;
		CONSOLE_SCREEN_BUFFER_INFO csbi;
		BOOL bLaunched;
		int hCrt;
		STARTUPINFO l_info;
#ifndef EIF_BORLAND
		FILE *hf;
#endif
		RT_GET_CONTEXT

			/* Find out if the calling process has initialized the HANDLEs. */
		memset(&l_info, 0, sizeof(STARTUPINFO));
		GetStartupInfo(&l_info);
		if ((l_info.dwFlags & STARTF_USESTDHANDLES) != STARTF_USESTDHANDLES) {
			AllocConsole();
		}

			/* Get all default standard handles */
		eif_conin = GetStdHandle (STD_INPUT_HANDLE);
		eif_conout = GetStdHandle (STD_OUTPUT_HANDLE);
		eif_conerr = GetStdHandle (STD_ERROR_HANDLE);

			/* Check if handles are available, allocate console if not */
			/* Raise an I/O exception if we cannot get a valid handle */
		if ((eif_conin == 0) || (eif_conin == INVALID_HANDLE_VALUE)) {
			AllocConsole ();
			eif_conin = GetStdHandle (STD_INPUT_HANDLE);
		}
		if (eif_conin == INVALID_HANDLE_VALUE) {
			eio ();
		}
		if ((eif_conout == 0) || (eif_conout == INVALID_HANDLE_VALUE)){
			AllocConsole ();
			eif_conout = GetStdHandle (STD_OUTPUT_HANDLE);
		}
		if (eif_conout == INVALID_HANDLE_VALUE) {
			eio ();
		}
		if ((eif_conerr == 0) || (eif_conerr == INVALID_HANDLE_VALUE)) {
			AllocConsole ();
			eif_conerr = GetStdHandle (STD_ERROR_HANDLE);
		}
		if (eif_conerr == INVALID_HANDLE_VALUE) {
			eio ();
		}

			/* If console was manually created, we are most likely in
			 * a Windows application that tries to output something.
			 * Therefore we need to correctly associated all standard
			 * handles `stdin', `stdout' and `stderr' to the new
			 * created console.
			 * Code was adapted from http://codeguru.earthweb.com/console/Console.html
			 * But also checkout Microsoft support web site:
			 * 	http://support.microsoft.com/default.aspx?scid=kb;EN-US;q105305
			 * 
			 * Note: For Borland, the above trick does not work, one has to
			 *  duplicate the handle, unfortunately the solution does not work
			 *  with Microsoft which explains the ifdef statement.
			 */
		EIF_CONSOLE_LOCK;
		if (!eif_console_allocated) {
			if (_get_osfhandle (_fileno (stdout)) != (intptr_t) eif_conout) {
				hCrt = _open_osfhandle ((intptr_t) eif_conout, _O_TEXT);
#ifdef EIF_BORLAND
				dup2 (hCrt, _fileno(stdout));
#else
				hf = _fdopen (hCrt, "w");
				*stdout = *hf;
#endif
			  	setvbuf(stdout, NULL, _IONBF, 0);
			}

			if (_get_osfhandle (_fileno (stderr)) != (intptr_t) eif_conerr) {
				hCrt = _open_osfhandle ((intptr_t) eif_conerr, _O_TEXT);
#ifdef EIF_BORLAND
				dup2 (hCrt, _fileno(stderr));
#else
				hf = _fdopen (hCrt, "w");
				*stderr = *hf;
#endif
			  	setvbuf(stderr, NULL, _IONBF, 0);
			}

			if (_get_osfhandle (_fileno (stdin)) != (intptr_t) eif_conin) {
				hCrt = _open_osfhandle ((intptr_t) eif_conin, _O_TEXT | _O_RDONLY);
#ifdef EIF_BORLAND
				dup2 (hCrt, _fileno(stdin));
#else
				hf = _fdopen (hCrt, "r");
				*stdin = *hf;
#endif
			}

				/* We are computing the cursor position to figure out, if the application
				* has been launched from a DOS console or from the Windows Shell
				*/
			GetConsoleScreenBufferInfo(eif_conout, &csbi);
			bLaunched = ((csbi.dwCursorPosition.X == 0) && (csbi.dwCursorPosition.Y == 0));
			if ((csbi.dwSize.X <= 0) || (csbi.dwSize.Y <= 0))
				bLaunched = FALSE;

			if (bLaunched == TRUE)
				eif_register_cleanup (eif_console_cleanup);

			eif_console_allocated = TRUE;
		}
		EIF_CONSOLE_UNLOCK;
	}
}

indexing
	description: "Objects that control the debugger session"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	author: "$Author$"
	date: "$Date$"
	revision: "$Revision$"

class
	DEBUGGER_CONTROLLER

inherit

	SHARED_EIFFEL_PROJECT
		export
			{NONE} all
		end

	PROJECT_CONTEXT
		export
			{NONE} all
		end

	SYSTEM_CONSTANTS
		export
			{NONE} all
		end

	EB_CONSTANTS
		export
			{NONE} all
		end

	EB_SHARED_PREFERENCES
		export
			{NONE} all
		end

	SHARED_BENCH_NAMES
		export
			{NONE} all
		end

create {DEBUGGER_MANAGER}
	make

feature {NONE} -- Initialization

	make (a_manager: DEBUGGER_MANAGER) is
			-- Initialize `Current'.
		do
			manager := a_manager
		end

feature -- Access

	param_arguments: STRING

	param_working_directory: STRING

	param_environment_variables: HASH_TABLE [STRING_32, STRING_32]

feature -- Change

	clear_params is
		do
			set_param_arguments (Void)
			set_param_working_directory (Void)
			set_param_environment_variables (Void)
		end

	set_param_arguments (v: like param_arguments) is
			-- set `v' to `param_arguments'.
		do
			param_arguments := v
		end

	set_param_working_directory (v: like param_working_directory) is
			-- set `v' to `param_working_directory'.
		do
			param_working_directory := v
		end

	set_param_environment_variables (v: like param_environment_variables) is
			-- set `v' to `param_environment_variables'.
		do
			param_environment_variables := v
		end

feature -- Debug Operation

	debug_application (a_execution_mode: INTEGER) is
			-- Launch the program from the project target.
		local
			launch_program: BOOLEAN
			makefile_sh_name: FILE_NAME
			uf: RAW_FILE
			make_f: PLAIN_TEXT_FILE
			l_il_env: IL_ENVIRONMENT
			l_app_string: STRING
			is_dotnet_system: BOOLEAN
			dotnet_debugger: STRING
		do
			launch_program := False
			if  (not Eiffel_project.system_defined) or else (Eiffel_System.name = Void) then
				warning (Warning_messages.w_No_system)
			elseif
				Eiffel_project.initialized and then
				Eiffel_project.system_defined and then
				Eiffel_system.system.il_generation and then
				Eiffel_system.system.msil_generation_type.is_equal ("dll")
			then
				warning (debugger_names.m_no_debugging_for_dll_system)
			elseif (not manager.application_is_executing) then
					--| Application is not running |--
				if
					Eiffel_project.initialized and then
					not Eiffel_project.Workbench.is_compiling
				then
						-- Application is not running. Start it.
					debug("DEBUGGER")
						io.error.put_string (generator)
						io.error.put_string ("(DEBUG_RUN): Start execution%N")
					end
					create makefile_sh_name.make_from_string (project_location.workbench_path)
					makefile_sh_name.set_file_name (Makefile_SH)

					create uf.make (Eiffel_system.application_name (True))
					create make_f.make (makefile_sh_name)

					is_dotnet_system := Eiffel_system.system.il_generation
					if uf.exists then
						if is_dotnet_system then
								--| String indicating the .NET debugger to launch if specified in the
								--| Preferences Tool.
							check preferences.debugger_data /= Void end
							dotnet_debugger := preferences.debugger_data.dotnet_debugger.item (1)

							create l_il_env.make (Eiffel_system.System.clr_runtime_version)
							if dotnet_debugger /= Void then
								l_app_string := l_il_env.Dotnet_debugger_path (dotnet_debugger)
							end
							if l_app_string /= Void then
									--| This means we are using either dbgclr or cordbg
								if a_execution_mode = {EXEC_MODES}.User_stop_points then
										--| With BP
									if l_il_env.use_cordbg (dotnet_debugger) then
											-- Launch cordbg.exe.
										(create {COMMAND_EXECUTOR}).execute_with_args
											(l_app_string,
												"%"" + eiffel_system.application_name (True) + "%" " + param_arguments)
										launch_program := True
									elseif l_il_env.use_dbgclr (dotnet_debugger) then
											-- Launch DbgCLR.exe.
										(create {COMMAND_EXECUTOR}).execute_with_args
											(l_app_string,
												"%"" + eiffel_system.application_name (True) + "%"")
										launch_program := True
									end
								else
										--| Without BP, we just launch the execution as it is
									(create {COMMAND_EXECUTOR}).execute_with_args (eiffel_system.application_name (True),
										param_arguments)
									launch_program := True
								end
							end
								--| if launch_program is False this mean we haven't launch the application yet
								--| for dotnet, this means we are using the EiffelStudio Debugger facilities.
						end
						if not launch_program then
							if
								not is_dotnet_system and then
								make_f.exists and then make_f.date > uf.date
							then
									-- The Makefile file is more recent than the application
								if_confirmed_do (Warning_messages.w_Makefile_more_recent (makefile_sh_name), agent c_compile)
							else
--								Output_manager.clear_general

								launch_program := True
								if manager.has_breakpoints and then a_execution_mode = {EXEC_MODES}.no_stop_points then
									discardable_if_confirmed_do (Warning_messages.w_Ignoring_all_stop_points,
														agent debug_workbench_application (a_execution_mode),
														2, preferences.dialog_data.confirm_ignore_all_breakpoints_string
													)
								else
									debug_workbench_application (a_execution_mode)
								end
							end
						end
					elseif make_f.exists then
							-- There is no application.
						warning (Warning_messages.w_No_system_generated)
					elseif Eiffel_project.Lace.compile_all_classes then
						warning (Warning_messages.w_None_system)
					else
						warning (Warning_messages.w_Must_compile_first)
					end
				end
			else
					--| Should not occurs
				check application_should_not_be_running: False end
			end
		end

	resume_workbench_application is
			-- Continue the execution of the program (stepping ...)
		local
			status: APPLICATION_STATUS
			app_exec: APPLICATION_EXECUTION
		do
			check debugger_running_and_stopped: manager.safe_application_is_stopped end
			app_exec := manager.application

			status := app_exec.status
			if status /= Void and then status.is_stopped then
				-- Application is stopped. Continue execution.
				debug("DEBUGGER")
					io.error.put_string (generator + ": Continue execution%N")
				end
				app_exec.on_application_before_resuming

					--| Continue the execution |--
				app_exec.continue

				if app_exec.is_running and then not app_exec.is_stopped then
					app_exec.on_application_resumed
				else
					debug ("debugger_trace")
						print ("Application is stopped, but it should not")
					end
				end
			end
		end

feature {DEBUGGER_MANAGER} -- Debugging operation

	debug_step_next is
		require
			safe_application_is_stopped: manager.safe_application_is_stopped
		do
			manager.application.set_execution_mode ({EXEC_MODES}.step_by_step)
			resume_workbench_application
		end

	debug_step_into is
		require
			safe_application_is_stopped: manager.safe_application_is_stopped
		do
			manager.application.set_execution_mode ({EXEC_MODES}.step_into)
			resume_workbench_application
		end

	debug_step_out is
		require
			safe_application_is_stopped: manager.safe_application_is_stopped
		do
			manager.application.set_execution_mode ({EXEC_MODES}.out_of_routine)
			resume_workbench_application
		end

	debug_run is
		require
			safe_application_is_stopped: manager.safe_application_is_stopped
		do
			manager.application.set_execution_mode ({EXEC_MODES}.user_stop_points)
			resume_workbench_application
		end

	debug_run_without_stop_points is
		require
			safe_application_is_stopped: manager.safe_application_is_stopped
		do
			manager.application.set_execution_mode ({EXEC_MODES}.no_stop_points)
			resume_workbench_application
		end

	debug_kill is
		require
			application_is_executing: manager.application_is_executing
		do
			manager.application.kill
		end

	debug_interrupt is
		require
			application_is_executing: manager.application_is_executing
		do
			manager.application.interrupt
		end

feature -- Start Operation

	start_workbench_application is
		local
			appl_name: STRING
			cmd_exec: COMMAND_EXECUTOR
			f: RAW_FILE
			f_name: FILE_NAME
			make_f: INDENT_FILE
			system_name: STRING
		do
			if Eiffel_project.initialized and then Eiffel_project.system_defined then
				system_name := Eiffel_system.name.twin
			end
			if system_name = Void then
				warning (Warning_messages.w_Must_compile_first)
			elseif
				Eiffel_system.system /= Void and then
				Eiffel_system.system.il_generation and then
				Eiffel_system.system.msil_generation_type.is_equal ("dll")
			then
				warning (debugger_names.m_no_debugging_for_dll_system)
			else
				check
					System_defined: Eiffel_system.Workbench.system_defined
				end
				appl_name := Eiffel_system.application_name (True)
				create f.make (appl_name)
				if not f.exists then
					warning (Warning_messages.w_Unexisting_system)
				else
					if Eiffel_system.System.il_generation then
							-- No need to check the `exe' as it is guaranteed to have been
							-- generated by the Eiffel compiler.
						create cmd_exec
						cmd_exec.execute_with_args_and_working_directory (appl_name, param_arguments, param_working_directory)
					else
						create f_name.make_from_string (project_location.workbench_path)
						f_name.set_file_name (Makefile_SH)
						create make_f.make (f_name)
						if make_f.exists and then make_f.date > f.date then
							warning (Warning_messages.w_MakefileSH_more_recent)
						else
							create cmd_exec
							cmd_exec.execute_with_args_and_working_directory (appl_name, param_arguments, param_working_directory)
						end
					end
				end
			end
		end

	start_finalized_application is
		local
			appl_name: STRING
			cmd_exec: COMMAND_EXECUTOR
			f: RAW_FILE
			f_name: FILE_NAME
			make_f: INDENT_FILE
			system_name: STRING
		do
			if Eiffel_project.initialized and then Eiffel_project.system_defined then
				system_name := Eiffel_system.name.twin
			end
			if system_name = Void then
				warning (Warning_messages.w_Must_finalize_first)
			elseif
				Eiffel_system.system /= Void and then
				Eiffel_system.system.il_generation and then
				Eiffel_system.system.msil_generation_type.is_equal ("dll")
			then
				warning (debugger_names.m_no_debugging_for_dll_system)
			else
				check
					System_defined: Eiffel_system.Workbench.system_defined
				end
				appl_name := Eiffel_system.application_name (False)
				create f.make (appl_name)
				if not f.exists then
					warning (Warning_messages.w_Unexisting_system)
				else
					if Eiffel_system.System.il_generation then
							-- No need to check the `exe' as it is guaranteed to have been
							-- generated by the Eiffel compiler.
						create cmd_exec
						cmd_exec.execute_with_args_and_working_directory (appl_name, param_arguments, param_working_directory)
					else
						create f_name.make_from_string (project_location.final_path)
						f_name.set_file_name (Makefile_SH)
						create make_f.make (f_name)
						if make_f.exists and then make_f.date > f.date then
							warning (Warning_messages.w_MakefileSH_more_recent)
						else
							create cmd_exec
							cmd_exec.execute_with_args_and_working_directory (appl_name, param_arguments, param_working_directory)
						end
					end
				end
			end
		end



feature {NONE} -- Callbacks

	before_starting is
		do
			manager.display_debugger_info
		end

	after_starting is
		do
		end

	warning (msg: STRING_GENERAL) is
		do
			manager.debugger_warning_message (msg)
		end

	if_confirmed_do (msg: STRING_GENERAL; a_action: PROCEDURE [ANY, TUPLE]) is
		do
		end

	discardable_if_confirmed_do (msg: STRING_GENERAL; a_action: PROCEDURE [ANY, TUPLE];
			a_button_count: INTEGER; a_pref_string: STRING) is
		do
		end

	activate_debugger_environment (b: BOOLEAN) is
		do
		end

feature {NONE} -- debugging

	debug_workbench_application (a_execution_mode: INTEGER) is
		require
			param_working_directory /= Void
		local
			working_dir: STRING
			environment_vars: like param_environment_variables
			l_cmd_line_arg: STRING
			app_exec: APPLICATION_EXECUTION
		do
			before_starting

				--| Getting well formatted workind directory path
			working_dir := param_working_directory
			environment_vars := param_environment_variables

				--| Building the command line argument
			l_cmd_line_arg := param_arguments
			if l_cmd_line_arg = Void then
				create l_cmd_line_arg.make_empty
			end

			if not directory_exists (working_dir) then
				warning (Warning_messages.w_Invalid_working_directory (working_dir))
				activate_debugger_environment (False)
			else
					-- Raise debugger before launching.
				if not manager.application_initialized then
					manager.create_application
				end

				activate_debugger_environment (True)
				app_exec := manager.application
				app_exec.set_execution_mode (a_execution_mode)
				app_exec.run (l_cmd_line_arg, working_dir, environment_vars)
				if manager.application_is_executing then
					if app_exec.execution_mode = {EXEC_MODES}.No_stop_points then
						manager.debugger_status_message (debugger_names.m_system_is_running_ignoring_breakpoints)
					else
						manager.debugger_message (debugger_names.m_system_is_running)
					end
					app_exec.on_application_launched
				else
						-- Something went wrong
					warning (app_exec.can_not_launch_system_message)
					app_exec.on_application_quit

					activate_debugger_environment (False)
				end
			end
		end

	c_compile is
			-- Freeze system.
		do
			if Eiffel_project.initialized then
				Eiffel_project.call_finish_freezing (True)
			end
		end

feature {DEBUGGER_MANAGER} -- Implementation

	manager: DEBUGGER_MANAGER

feature {NONE} -- Implementation

	directory_exists (a_dirname: STRING): BOOLEAN is
			-- Is directory named `a_dirname' exists ?
		local
			d: DIRECTORY
		do
			create d.make (a_dirname)
			Result := d.exists
		end

invariant

	manager_not_void: manager /= Void

indexing
	copyright:	"Copyright (c) 1984-2006, Eiffel Software"
	license:	"GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options:	"http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful,	but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the	GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA
		]"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end

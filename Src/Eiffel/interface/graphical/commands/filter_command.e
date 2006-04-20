indexing
	description: "Command to filter the text in some way."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class FILTER_COMMAND 

inherit
	EIFFEL_ENV

	TOOL_COMMAND
		rename
			init as make
		end

	SHARED_FORMAT_TABLES

	WARNER_CALLBACKS
		rename
			execute_warner_ok as modified_warner_ok_press
		end

create
	make

feature -- Callbacks

	execute_warner_help is
		do
		end

	modified_warner_ok_press (argument: ANY) is
			-- If it comes here this means ok has
			-- been pressed in the warner window
			-- for text modification.
		do
			tool.last_format.associated_command.filter (filter_name)
		end

feature -- Properties

	filter_window: FILTER_W
			-- Associated popup window

	filter_name: STRING is
			-- Name of the filter to be applied
		local
			filter_dir: DIRECTORY
			file_name, dir_entry: STRING
			found: BOOLEAN
		once
			Result := General_resources.filter_name.value
				-- Check whether that filter exists or not.
			create filter_dir.make (filter_path)
			if filter_dir.exists and then filter_dir.is_readable then
				from
					file_name := clone (Result)
					file_name.to_lower
					file_name.append (".fil")
					filter_dir.open_read
					filter_dir.start
					filter_dir.readentry
					dir_entry := filter_dir.lastentry
				until
					found or dir_entry = Void
				loop
					dir_entry.to_lower
					found := dir_entry.is_equal (file_name)
					filter_dir.readentry
					dir_entry := filter_dir.lastentry
				end
			end
			if not found then
				Result := ""
			end
		end

feature -- Closure

	close_filter_window is
			-- Popdown the filter window.
		do
			if filter_window /= Void then
				filter_window.popdown
			end
		end

feature {NONE} -- Implementation

	work (argument: ANY) is
			-- If left mouse button was pressed -> execute filter.
			-- If right mouse button was pressed -> bring up filter window. 
		local
			cmd_string: STRING
			filterable_format: FILTERABLE
			shell_request: COMMAND_EXECUTOR
			filename, new_text: STRING
			mp: MOUSE_PTR
		do
			if argument = tool then
					-- Popup filter window
				if filter_window = Void then
					create mp.set_watch_cursor
					create filter_window.make (Current)
					mp.restore
				end
				filter_window.call (Current)
			elseif argument = filter_window then
					-- Display the filter output in `text_window'
				if text_window.changed then
					warner (popup_parent).custom_call (Current, Warning_messages.w_File_changed (Void),
						Interface_names.b_Yes, Interface_names.b_No, Interface_names.b_Cancel)
				else
					tool.last_format.associated_command.filter (filter_name)
				end
			elseif tool.stone /= Void then
					-- Execute the shell command
				filterable_format ?= tool.last_format.associated_command
				if filterable_format = Void then
					warner (popup_parent).gotcha_call (Warning_messages.w_Not_a_filterable_format)
				else
					create mp.set_watch_cursor
					if 
						filterable_format.filtered and
						equal (filterable_format.filter_name, filter_name) 
					then
							-- The filtered text is in `text_window'
						filename := filterable_format.temp_filtered_file_name
										(tool.stone, filter_name)
						save_to_file (text_window.text, filename)
						text_window.set_changed (false)
					else
						new_text := filterable_format.filtered_text 
										(tool.stone, filter_name) 
							-- `filtered_text' of FILTERABLE has a side effect
							-- (i.e. set the suffix to be used to build the
							-- targetted file name) and as a consequence we
							-- cannot put the next line outside of the
							-- if-instruction.
						filename := filterable_format.temp_filtered_file_name
										(tool.stone, filter_name)
						if new_text /= Void then
							save_to_file (new_text, filename)
						end
					end
					cmd_string := clone (General_resources.filter_command.value)
					if not cmd_string.is_empty then
						cmd_string.replace_substring_all ("$target", filename)
					end
					create shell_request
					shell_request.execute (cmd_string)
					mp.restore
				end
			end
		end
	
	save_to_file (a_text: STRING a_filename: STRING) is
			-- Save `a_text' in `a_filename'.
		require
			a_text_not_void: a_text /= Void
			a_filename_not_void: a_filename /= Void
		local
			char: CHARACTER
			new_file: PLAIN_TEXT_FILE
		do
			if not a_filename.is_empty then
				create new_file.make (a_filename)
				if new_file.exists and then not new_file.is_plain then
					warner (popup_parent).gotcha_call 
						(Warning_messages.w_Not_a_plain_file (new_file.name))
				elseif new_file.exists and then not new_file.is_writable then
					warner (popup_parent).gotcha_call 
						(Warning_messages.w_Not_writable (new_file.name))
				elseif not new_file.exists and then not new_file.is_creatable then
					warner (popup_parent).gotcha_call 
						(Warning_messages.w_Not_creatable (new_file.name))
				else
					new_file.open_write
					if not a_text.is_empty then
						new_file.put_string (a_text)
						char := a_text.item (a_text.count)
						if Platform_constants.is_unix and then char /= '%N' and then char /= '%R' then
								-- Add a carriage return like vi 
								-- if there's none at the end
							new_file.put_new_line
						end
					end
					new_file.close
				end
			end
		end

feature -- Access

	name: STRING is
			-- Name of the command.
		do
			Result := Interface_names.f_Filter
		end

	menu_name: STRING is
			-- Name used in menu entry
		do
			Result := Interface_names.m_Filter
		end

	accelerator: STRING is
			-- Accelerator action for menu entry
		do
		end

invariant

	filter_name_not_void: filter_name /= Void

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

end -- class FILTER_COMMAND

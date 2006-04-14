indexing
	description: "User specific options."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	USER_OPTIONS

feature -- Access

	eifgen: STRING
			-- EIFGEN location.

	arguments: ARRAYED_LIST [STRING]
			-- List of arguments used by current project.

	last_argument: STRING
			-- Last used argument.

	use_arguments: BOOLEAN
			-- Use arguments?

	working_directory: STRING
			-- Working directory.

feature -- Update

	set_eifgen (a_location: like eifgen) is
			-- Set `eifgen' to `a_location'.
		require
			a_location_not_void: a_location /= Void
		do
			eifgen := a_location
		ensure
			eifgen_set: eifgen = a_location
		end

	set_arguments (an_arguments: like arguments) is
			-- Set `arguments' to `an_arguments'.
		do
			arguments := an_arguments
		ensure
			arguments_set: arguments = an_arguments
		end

	set_last_argument (an_argument: like last_argument) is
			-- Set `last_argument' to `an_argument'.
		do
			last_argument := an_argument
		ensure
			last_argument_set: last_argument = an_argument
		end

	enable_arguments is
			-- Enable use of arguments.
		do
			use_arguments := True
		ensure
			use_arguments: use_arguments
		end

	disable_arguments is
			-- Disable use of arguments.
		do
			use_arguments := False
		ensure
			not_use_arguments: not use_arguments
		end

	set_working_directory (a_directory: like working_directory) is
			-- Set `working_directory' to `a_directory'.
		do
			working_directory := a_directory
		ensure
			working_directory_set: working_directory = a_directory
		end

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

indexing

	description:
		"Abstract notion of a command to show or %
		%hide a portion of the debugger."
	legal: "See notice at end of class."
	status: "See notice at end of class.";
	date: "$Date$";
	revision: "$Revision$"

deferred class DISPLAY_DEBUGGER_PORTION

inherit 

	PIXMAP_COMMAND
		rename
			init as make
		redefine
			make
		end


feature

	make (a_tool: like tool) is
			-- Initialize a command with the `symbol' icon,
			-- `a_tool' is passed as argument to the activation action.
		do
			tool := a_tool
			is_shown := False
--			is_shown := True
		end

feature -- Properties

	is_shown: BOOLEAN
			-- Is Current shown?

	holder: EB_HOLDER;
			-- Holder

feature -- Element change

	set_holder (h: like holder) is
			-- Set `holder' to `h'.
		do
			holder := h
		end;

feature -- Execution

	work (argument: ANY) is
			-- Execute Current.
		do
			if is_shown then
				hide
			else
				show
			end
		end;

	hide is
			-- Hide Current.
		require
			is_shown: is_shown
		deferred
		end;

	show is
			-- Show Current.
		require
			not_is_shown: not is_shown
		deferred
		end;

feature {NONE} -- Implementation

	update_visual_aspects is
			-- Update the button and menu entry from `holder'.
		do
  			holder.associated_button.set_symbol (symbol);
 			holder.associated_menu_entry.set_text (name)
		end;

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

end -- class DISPLAY_DEBUGGER_PORTION

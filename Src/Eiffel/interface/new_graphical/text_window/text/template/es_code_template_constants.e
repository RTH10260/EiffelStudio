note
	description: "[
		Constants class providing most common metadate used in code templates
		title, description, tags, etc.
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	ES_CODE_TEMPLATE_CONSTANTS


feature -- Access:Metadata

	Title: STRING = "title"
			-- Code template title.

	Tags: STRING = "tags"
			-- Code template tags.

	Default_value: STRING = "default"
			-- Code template default.

feature -- Access:Template

	Template: STRING = "TEMPLATE"
			-- All templates should inherit from a fictitious `TEMPLATE' class.


	Feature_target: STRING = "target"
			-- feature target of class TEMPLATE
			-- The feature will be available iff TEMPLATE has a GENERIC PARAMETER
			--| Example
            --|
			--| class ARRAY_TEMPLATE [T -> COMPARABLE]
			--| inherit
  			--|      TEMPLATE [ARRAY [T]]
		    --| in this case the target feature of the class TEMPLATE will be
		    --| target:  ARRAY [COMPARABLE]
		    --|
		    --| class MY_TEMPLATE
			--| inherit
  			--|       TEMPLATE


  	Template_version: STRING = "template_version"

note
	copyright: "Copyright (c) 1984-2016, Eiffel Software"
	license: "GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options: "http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful, but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
		]"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end

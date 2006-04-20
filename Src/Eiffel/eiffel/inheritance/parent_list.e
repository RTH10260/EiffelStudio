indexing
	legal: "See notice at end of class."
	status: "See notice at end of class."
-- Eiffel class generated by the 2.3 to 3 translator.

class PARENT_LIST 

inherit
	FIXED_LIST [PARENT_C]

create
	make, make_filled

feature -- Merging parents

	merge_and_check_renamings (inherit_table: INHERIT_TABLE) is
			-- Go through each parents and merge them into `inherit_table'
			-- Check also the renaming clause of the parents
		local
			p: PARENT_C
			l_area: SPECIAL [PARENT_C]
			i, nb: INTEGER
		do
			from
				l_area := area
				nb := count
			until
				i = nb
			loop
				p := l_area.item (i)
				inherit_table.merge (p)
				p.check_validity1
				i := i + 1
			end
		end

feature -- Validity

	check_validity2 is
			-- Check the redefine and select clause
		local
			l_area: SPECIAL [PARENT_C]
			i, nb: INTEGER
		do
			from
				l_area := area
				nb := count
			until
				i = nb
			loop
				l_area.item(i).check_validity2
				i := i + 1
			end
		end

	check_validity4 is
			-- Check useless selection 
		local
			l_area: SPECIAL [PARENT_C]
			i, nb: INTEGER
			p: PARENT_C
		do
			from
				l_area := area
				nb := count
			until
				i = nb
			loop
				p := l_area.item(i)
				if not (p.selecting = Void) then
					p.check_validity4
				end
				i := i + 1
			end
		end

	is_selecting (feature_name_id: INTEGER): BOOLEAN is
			-- Are the parents selecting `feature_name_id'?
		require
			good_argument: feature_name_id > 0
		local
			l_area: SPECIAL [PARENT_C]
			i, nb: INTEGER
		do
			from
				l_area := area
				nb := count
			until
				Result or else i = nb
			loop
				Result := l_area.item(i).is_selecting (feature_name_id)
				i := i + 1
			end
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

end -- class PARENT_LIST

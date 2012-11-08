note
	description: "Abstract description of a parent. Version for Bench."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class PARENT_AS

inherit
	AST_EIFFEL
		redefine
			is_equivalent
		end

create
	initialize

feature {NONE} -- Initialization

	initialize (t: like type; rn: like internal_renaming; e: like internal_exports;
		u: like internal_undefining; rd: like internal_redefining; s: like internal_selecting; ek: like end_keyword)
			-- Create a new PARENT AST node.
		require
			t_not_void: t /= Void
		do
			type := t
			internal_renaming := rn
			internal_exports := e
			internal_undefining := u
			internal_redefining := rd
			internal_selecting := s
			if ek /= Void then
				end_keyword_index := ek.index
			end
		ensure
			type_set: type = t
			internal_renaming_set: internal_renaming = rn
			internal_exports_set: internal_exports = e
			internal_undefining_set: internal_undefining = u
			internal_redefining_set: internal_redefining = rd
			internal_selecting_set: internal_selecting = s
			end_keyword_set: ek /= Void implies end_keyword_index = ek.index
		end

feature -- Visitor

	process (v: AST_VISITOR)
			-- process current element.
		do
			v.process_parent_as (Current)
		end

feature -- Attributes

	type: CLASS_TYPE_AS
			-- Parent type

	renaming: detachable EIFFEL_LIST [RENAME_AS]
			-- Rename clause
		local
			l_internal_renaming: like internal_renaming
		do
			l_internal_renaming := internal_renaming
			if l_internal_renaming /= Void then
				Result := l_internal_renaming.meaningful_content
			else
				Result := Void
			end
		ensure
			good_result: (internal_renaming = Void implies Result = Void) and
						 (internal_renaming /= Void implies Result = internal_renaming.meaningful_content)
		end

	exports: detachable EIFFEL_LIST [EXPORT_ITEM_AS]
			-- Exports for parent
		local
			l_internal_exports: like internal_exports
		do
			l_internal_exports := internal_exports
			if l_internal_exports /= Void then
				Result := l_internal_exports.meaningful_content
			else
				Result := Void
			end
		ensure
			good_result: (internal_exports = Void implies Result = Void) and
						 (internal_exports /= Void implies ((internal_exports.meaningful_content = Void implies Result = Void) and
						 								   (internal_exports.meaningful_content /= Void implies (Result /= Void and then Result ~ internal_exports.meaningful_content)))
)		end

	undefining: detachable EIFFEL_LIST [FEATURE_NAME]
			-- Undefine clause
		local
			l_internal_undefining: like internal_undefining
		do
			l_internal_undefining := internal_undefining
			if l_internal_undefining /= Void then
				Result := l_internal_undefining.meaningful_content
			else
				Result := Void
			end
		ensure
			good_result: (internal_undefining = Void implies Result = Void) and
						 (internal_undefining /= Void implies Result = internal_undefining.meaningful_content)
		end

	redefining: detachable EIFFEL_LIST [FEATURE_NAME]
			-- Redefining clause
		local
			l_internal_redefining: like internal_redefining
		do
			l_internal_redefining := internal_redefining
			if l_internal_redefining /= Void then
				Result := l_internal_redefining.meaningful_content
			else
				Result := Void
			end
		ensure
			good_result: (internal_redefining = Void implies Result = Void) and
						 (internal_redefining /= Void implies Result = internal_redefining.meaningful_content)
		end

	selecting: detachable EIFFEL_LIST [FEATURE_NAME]
			-- Select clause
		local
			l_internal_selecting: like internal_selecting
		do
			l_internal_selecting := internal_selecting
			if l_internal_selecting /= Void then
				Result := l_internal_selecting.meaningful_content
			else
				Result := Void
			end
		ensure
			good_result: (internal_selecting = Void implies Result = Void) and
						 (internal_selecting /= Void implies Result = internal_selecting.meaningful_content)
		end

	end_keyword_index: INTEGER
			-- End of clause if any of the `rename', `export', `redefine', `undefine'
			-- and `select' is present

	end_keyword (a_list: LEAF_AS_LIST): detachable KEYWORD_AS
			-- End of clause if any of the `rename', `export', `redefine', `undefine'
			-- and `select' is present
		require
			a_list_not_void: a_list /= Void
		local
			i: INTEGER
		do
			i := end_keyword_index
			if a_list.valid_index (i) then
				Result ?= a_list.i_th (i)
			end
		end

feature -- Roundtrip

	internal_exports: detachable EXPORT_CLAUSE_AS
			-- Internal exports for parent

	internal_renaming: detachable RENAME_CLAUSE_AS
			-- Internal rename clause

	internal_redefining: detachable REDEFINE_CLAUSE_AS
			-- Internal redefining clause

	internal_undefining: detachable UNDEFINE_CLAUSE_AS
			-- Internal undefine clause

	internal_selecting: detachable SELECT_CLAUSE_AS
			-- Internal select clause

	index: INTEGER
			-- <Precursor>
		do
			Result := end_keyword_index
			if Result <= 0 then
				Result := type.index
			end
		end

feature -- Roundtrip/Token

	first_token (a_list: detachable LEAF_AS_LIST): detachable LEAF_AS
			-- First token in current AST node
		do
			Result := type.first_token (a_list)
		end

	last_token (a_list: detachable LEAF_AS_LIST): detachable LEAF_AS
			-- Last token in current AST node
		do
			if a_list /= Void and end_keyword_index /= 0 then
				Result := end_keyword (a_list)
			else
				Result := type.last_token (a_list)
			end
		end

feature -- Comparison

	is_equivalent (other: like Current): BOOLEAN
			-- Is `other' equivalent to the current object ?
		do
			Result := equivalent (exports, other.exports) and
				equivalent (redefining, other.redefining) and
				equivalent (renaming, other.renaming) and
				equivalent (selecting, other.selecting) and
				equivalent (type, other.type) and
				equivalent (undefining, other.undefining)
		end

feature -- Status report

	is_effecting: BOOLEAN
			-- Is this parent clause redefining or undefining
			-- one or more features?
		do
			Result := undefining /= Void and then not undefining.is_empty
				and then redefining /= Void and then not redefining.is_empty
		end

note
	copyright:	"Copyright (c) 1984-2012, Eiffel Software"
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

end -- class PARENT_AS

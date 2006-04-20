indexing
	description: "Class for an staticed type on a feature."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision $"

class
	LIKE_FEATURE

inherit
	LIKE_TYPE_A
		redefine
			update_dependance
		end

	SHARED_NAMES_HEAP
		export
			{NONE} all
		end

create
	make

feature -- Initialization and reinitialization

	make (f: FEATURE_I; a_context_class_id: INTEGER) is
			-- Creation
		require
			valid_argument: f /= Void
			a_context_class_id_positive: a_context_class_id > 0
		do
			feature_id := f.feature_id
			routine_id := f.rout_id_set.first
			feature_name_id := f.feature_name_id
			class_id := a_context_class_id
		ensure
			feature_id_set: feature_id = f.feature_id
			routine_id_set: routine_id = f.rout_id_set.first
			feature_name_id_set: feature_name_id = f.feature_name_id
			class_id_set: class_id = a_context_class_id
		end

feature -- Visitor

	process (v: TYPE_A_VISITOR) is
			-- Process current element.
		do
			v.process_like_feature (Current)
		end

feature -- Properties

	feature_name_id: INTEGER
			-- Feature name ID of anchor

	class_id: INTEGER;
			-- Class ID of the class where the anchor is referenced

	feature_name: STRING is
			-- Final name of anchor.
		require
			feature_name_id_set: feature_name_id >= 1
		do
			Result := Names_heap.item (feature_name_id)
		ensure
			Result_not_void: Result /= Void
			Result_not_empty: not Result.is_empty
		end

feature {COMPILER_EXPORTER} -- Implementation: Access

	feature_id: INTEGER
			-- Feature ID of the anchor

	routine_id: INTEGER
			-- Routine ID of anchor in context of `class_id'.

feature -- Access

	same_as (other: TYPE_A): BOOLEAN is
			-- Is the current type the same as `other' ?
		local
			other_like_feat: LIKE_FEATURE
		do
			other_like_feat ?= other
			Result := 	other_like_feat /= Void
					and then other_like_feat.routine_id = routine_id
					and then other_like_feat.feature_id = feature_id
		end

	update_dependance (feat_depend: FEATURE_DEPENDANCE) is
			-- Update dependency for Dead Code Removal
		local
			a_class: CLASS_C
			depend_unit: DEPEND_UNIT
			feature_i: FEATURE_I
		do
				-- we must had a dependance to the anchor feature
			a_class := System.class_of_id (class_id)
			feature_i := a_class.feature_table.item_id (feature_name_id)
			create depend_unit.make (class_id, feature_i)
			feat_depend.extend (depend_unit)
		end

feature -- Output

	dump: STRING is
			-- Dumped trace
		local
			s: STRING
		do
			s := actual_type.dump
			create Result.make (18 + s.count)
			Result.append ("[like " + feature_name +"] ")
			Result.append (s)
		end

	ext_append_to (st: TEXT_FORMATTER; f: E_FEATURE) is
		local
			ec: CLASS_C
			l_feat: E_FEATURE
		do
			ec := Eiffel_system.class_of_id (class_id)
			st.process_symbol_text (ti_l_bracket)
			st.process_keyword_text (ti_like_keyword, Void)
			st.add_space
			if ec.has_feature_table then
				l_feat := ec.feature_with_name (feature_name)
			end
			if l_feat /= Void then
				st.add_feature (l_feat, feature_name)
			else
				st.add_feature_name (feature_name, ec)
			end
			st.process_symbol_text (ti_r_bracket)
			st.add_space
			if is_valid then
				actual_type.ext_append_to (st, f)
			end
		end

feature -- Primitives

	instantiation_in (type: TYPE_A; written_id: INTEGER): LIKE_FEATURE is
			-- Instantiation of Current in the context of `class_type',
			-- assuming that Current is written in class of id `written_id'.
		do
			Result := twin
			Result.set_actual_type
							(actual_type.instantiation_in (type, written_id))
		end

	create_info: CREATE_FEAT is
			-- Byte code information for entity type creation
		do
			create Result.make (feature_id, routine_id, system.class_of_id (class_id))
		end

feature -- Comparison

	is_equivalent (other: like Current): BOOLEAN is
			-- Is `other' equivalent to the current object ?
		do
			Result := routine_id = other.routine_id and then
				class_id = other.class_id and then
				feature_id = other.feature_id and then
				equivalent (actual_type, other.actual_type) and then
				feature_name_id = other.feature_name_id
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

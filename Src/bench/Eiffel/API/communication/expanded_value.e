indexing

	description: 
		"Run time value representing an expanded object.";
	date: "$Date$";
	revision: "$Revision $"

class

	EXPANDED_VALUE

inherit

	DEBUG_VALUE
		redefine
			set_hector_addr, append_to,
			append_type_and_value
		end

creation {ATTR_REQUEST}

	make_attribute

feature {ATTR_REQUEST}

	make_attribute (attr_name: like name; a_class: like e_class; 
			type: like dynamic_type_name) is
		require
			not_attr_name_void: attr_name /= Void;
			not_type_void: type /= Void
		do
			name := attr_name;
			dynamic_type_name := type;
			if a_class /= Void then
				e_class := a_class;
				is_attribute := True;
			end;
			!! attributes.make
		end;

feature -- Property

	attributes: SORTED_TWO_WAY_LIST [DEBUG_VALUE];
			-- Attributes of expanded object

feature -- Access

	dynamic_class: E_CLASS is
		local
			class_i: CLASS_I;
			type_name: STRING
		do
			Result := private_dynamic_class;
			if Result = Void then
				type_name := clone (dynamic_type_name);
				type_name.to_lower;
				class_i := Eiffel_universe.class_with_name (type_name);
				if class_i /= Void then
					Result := class_i.compiled_eclass;
					private_dynamic_class := Result
				end
			end	
		end;

feature -- Output

	append_to (st: STRUCTURED_TEXT; indent: INTEGER) is
			-- Append `Current' to `st' with `indent' tabs the left margin.
		local
			ec: E_CLASS;
		do
			append_tabs (st, indent);
			st.add_feature_name (name, e_class)
			st.add_string (": expanded ");
			ec := dynamic_class;
			if ec /= Void then
				ec.append_name (st);
				st.add_new_line;
				append_tabs (st, indent + 1);
				st.add_string ("-- begin sub-object --");
				st.add_new_line;
				from
					attributes.start
				until
					attributes.after
				loop
					attributes.item.append_to (st, indent + 2);
					attributes.forth
				end;
				append_tabs (st, indent + 1);
				st.add_string ("-- end sub-object --");
				st.add_new_line
			else
				Any_class.append_name (st);
				st.add_string (" = Unknown")
			end
		end;

	append_type_and_value (st: STRUCTURED_TEXT) is
		do
		end;

feature {NONE} -- Implementation

	set_hector_addr is
			-- Convert the physical addresses received from the application
			-- to hector addresses. (should be called only once just after
			-- all the information has been received from the application.)
		do
			from
				attributes.start
			until
				attributes.after
			loop
				attributes.item.set_hector_addr;
				attributes.forth
			end;
		end;

feature {NONE} -- Implementation

	dynamic_type_name: STRING;
			-- Dynamic type of expanded object

	private_dynamic_class: E_CLASS
			-- Saved class

invariant

	is_attribute: is_attribute;
	attributes_exists: attributes /= Void;
	dynamic_type_not_void: dynamic_type_name /= Void

end -- class EXPANDED_VALUE

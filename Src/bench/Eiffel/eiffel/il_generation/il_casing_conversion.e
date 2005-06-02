indexing
	description: "[
		Perform conversion of Eiffel name to whichever format is specified in Ace file.

		Note: The algorithm used in `camel_casing' must match the one used in the expression
			evaluator of ENViSioN!, please notify the ENViSioN! team prior to modifying!
		]"
	date: "$Date$"
	revision: "$Revision$"

class
	IL_CASING_CONVERSION

feature -- Naming convention

	lower_case: INTEGER is 1
	upper_case: INTEGER is 2
			-- Conversion type for `pascal_casing'.
			
	pascal_casing (is_dotnet_name: BOOLEAN; name: STRING; type: INTEGER): STRING is
			-- Convert `name' using PascalCasing convention.
			-- If `type' is `upper_case' and if default is to use
			-- Eiffel convention, result is upper case.
			--| Used for all names apart for attributes in
			--| implementation classes.
		require
			name_not_void: name /= Void
			name_not_empty: not name.is_empty
			valid_type: type = lower_case or type = upper_case
		local
			i, nb: INTEGER
			l_c: CHARACTER
		do
			Result := name
			if is_dotnet_name then
				Result := Result.twin
				from
					i := 2
					nb := Result.count
					Result.put (Result.item (1).upper, 1)
				until
					i > nb
				loop
						-- When we encounter a '_' we delete it if it is not the last one
						-- in `Result' and the character following the `_' has its case
						-- changed  to upper.
					l_c := Result.item (i)
					if l_c = '_' and i < nb then
						l_c := Result.item (i + 1)
						if l_c.upper /= l_c then
							Result.remove (i)
							nb := nb - 1
							Result.put (l_c.upper, i)
						end
					end
					i := i + 1
				end
			else
				if type = upper_case then
					Result := name.as_upper
				end
			end
		ensure
			result_not_void: Result /= Void
		end

	camel_casing (is_dotnet_name: BOOLEAN; name: STRING): STRING is
			-- Convert `name' using camelCasing convention.
			--| Used only for attributes in implementation classes.
		require
			name_not_void: name /= Void
			name_not_empty: not name.is_empty
		local
			i, nb: INTEGER
			l_c: CHARACTER
		do
			Result := name
			if is_dotnet_name then
				Result := Result.twin
				from
					i := 2
					nb := Result.count
				until
					i > nb
				loop
						-- When we encounter a '_' we delete it if it is not the last one
						-- in `Result' and the character following the `_' has its case
						-- changed  to upper.
					l_c := Result.item (i)
					if l_c = '_' and i < nb then
						l_c := Result.item (i + 1)
						if l_c.upper /= l_c then
							Result.remove (i)
							nb := nb - 1
							Result.put (l_c.upper, i)
						end
					end
					i := i + 1
				end
			else
					-- Do nothing as `Result' is already in lowercase.
				check
					already_lower_case: Result.as_lower.is_equal (Result)
				end
			end
		ensure
			result_not_void: Result /= Void
		end

	namespace_casing (is_dotnet_name: BOOLEAN; name: STRING): STRING is
			-- Convert `name' using PascalCasing convention
			-- on namesapce. Different from `pascal_casing'
			-- as we convert a character in upper after a
			-- `.' or a `_'.
		require
			name_not_void: name /= Void
			name_not_empty: not name.is_empty
			not_dot_terminated: name.item (name.count) /= '.'
		local
			i, nb: INTEGER
		do
			Result := name
			if is_dotnet_name then
				Result := Result.twin
				from
					i := 2
					nb := Result.count
					Result.put (Result.item (1).upper, 1)
				until
					i > nb
				loop
						-- When we encounter a '_' we delete it
						-- if it is not the last one in `Result'
						-- and the character following the `_'
						-- has its case changed  to upper.
					if Result.item (i) = '_' and i < nb then
						Result.remove (i)
						nb := nb - 1
						Result.put (Result.item (i).upper, i)
					elseif Result.item (i) = '.' then
						i := i + 1
							-- Precondition is there to prevent us
							-- for accessing beyond the last element.
						Result.put (Result.item (i).upper, i)
					end
					i := i + 1
				end
			end
		ensure
			result_not_void: Result /= Void
		end

	type_name (a_namespace, a_prefix, a_name: STRING; is_dotnet_naming: BOOLEAN): STRING is
			-- Name of type `a_name' with prefix `a_prefix' in namespace `a_namespce' that follows
			-- CIL naming rules according to `is_dotnet_naming'.
		require
			a_prefix_not_empty_if_not_void: a_prefix /= Void implies not a_prefix.is_empty
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			create Result.make_empty
			if a_namespace /= Void then
				Result.append_string (namespace_casing (is_dotnet_naming, a_namespace))
				if not Result.is_empty then
					Result.append_character ('.')	
				end
			end
			if a_prefix /= Void then
				Result.append_string (a_prefix)
				Result.append_character ('.')
			end
			Result.append_string (pascal_casing (is_dotnet_naming, a_name, upper_case))
		end

end -- class IL_CASING_CONVERSION

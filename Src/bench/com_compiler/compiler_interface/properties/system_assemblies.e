indexing
	description: "Retrieves and sets the Assembly properties of the ace file"
	date: "$Date$"
	revision: "$Revision$"

class
	SYSTEM_ASSEMBLIES

inherit
	IEIFFEL_SYSTEM_ASSEMBLIES_IMPL_STUB
		redefine
			add_assembly,
			add_fusion_assembly,
			assemblies,
			last_exception,
			store,
			flush_assemblies,
			add_assembly_user_precondition
		end
	LACE_AST_FACTORY
		export
			{NONE} all
		end

create 
	make
	
feature {NONE} -- Initialization

	make (ace: ACE_FILE_ACCESSER) is
			-- Initialize with all data taken from `ace_accesser'.
		require
			non_void_ace_accesser: ace /= Void
		local
			al: LACE_LIST [ASSEMBLY_SD]
		do
			ace_accesser := ace
			al ?= ace_accesser.root_ast.assemblies
			if al /= Void then
				from
						-- Detached store information from original.
					al := al.duplicate

						-- Initialize assemblies list
					create assemblies_table.make (al.count)
					create assemblies_impl.make (al.count)
					al.start
				until
					al.after
				loop
					assemblies_table.put (al.item, al.item.cluster_name)
					assemblies_impl.extend (al.item)
					al.forth
				end
			else
				create assemblies_table.make (13)
				create assemblies_impl.make (0)
			end
		end

feature -- Access

	flush_assemblies is
			-- clear currently held assemblies
		do
			assemblies_table.wipe_out
			assemblies_impl.wipe_out
		end
		
	add_assembly (a_prefix, a_cluster_name, a_path: STRING; a_copy: BOOLEAN) is
			-- add an assembly to ace
		require else
			non_void_cluster_name: a_cluster_name /= Void
			valid_cluster_name: is_valid_cluster_name (a_cluster_name)
			non_void_path: a_path /= Void
			valid_path: not a_path.is_empty
		local
			l_assembly: ASSEMBLY_SD
			l_cluster_name: STRING
		do
			l_cluster_name := a_cluster_name.twin
			
			if not assemblies_table.has (l_cluster_name) then
				if a_prefix /= Void and not a_prefix.is_empty then
					create l_assembly.initialize (new_id_sd (l_cluster_name, True), new_id_sd (a_path, True), new_id_sd (a_prefix, False), Void, Void, Void)					
				else
					create l_assembly.initialize (new_id_sd (l_cluster_name, True), new_id_sd (a_path, True), Void, Void, Void, Void)
				end
				assemblies_table.put (l_assembly, l_cluster_name)
				assemblies_impl.extend (l_assembly)
			end
		end
		
	add_fusion_assembly (a_prefix, a_cluster_name, a_name, a_version, a_culture, a_public_key_token: STRING; a_copy: BOOLEAN) is
			-- add an assembly to ace
		require else
			non_void_cluster_name: a_cluster_name /= Void
			valid_cluster_name: is_valid_cluster_name (a_cluster_name)
			non_void_name: a_name /= Void
			valid_name: not a_name.is_empty
			non_void_version: a_version /= Void
			valid_version: not a_version.is_empty
			non_void_public_key_token: a_public_key_token /= Void
			valid_public_key_token: not a_public_key_token.is_empty
		local
			l_assembly: ASSEMBLY_SD
			l_cluster_name: STRING
			l_culture: STRING
		do
			l_cluster_name := a_cluster_name.twin
			
			if a_culture = Void or else a_culture.is_empty then
				l_culture := "neutral"	
			end
			
			if not assemblies_table.has (l_cluster_name) then
				if a_prefix /= Void and then not a_prefix.is_empty then
					create l_assembly.initialize (new_id_sd (l_cluster_name, True), new_id_sd (a_name, True), new_id_sd (a_prefix, False), new_id_sd (a_version, True), new_id_sd (l_culture, True), new_id_sd (a_public_key_token, True))
				else
					create l_assembly.initialize (new_id_sd (l_cluster_name, True), new_id_sd (a_name, True), Void, new_id_sd (a_version, True), new_id_sd (l_culture, True), new_id_sd (a_public_key_token, True))
				end
				assemblies_table.put (l_assembly, l_cluster_name)
				assemblies_impl.extend (l_assembly)
			end
		end

	store is
			-- save the assemblies to the ace file
		local
			l_assemblies: LACE_LIST [ASSEMBLY_SD]
			copy_assemblies: like assemblies_table
		do
			-- Save assemblies
			copy_assemblies := assemblies_table.twin
			l_assemblies := ace_accesser.root_ast.assemblies
			if l_assemblies = Void then
					-- if there is no assembly option then we need to create it
				create l_assemblies.make (assemblies_table.count)
				ace_accesser.root_ast.set_assemblies (l_assemblies)
			end
			
			-- remove assemblies that already are in AST from copy_assemblies
			from
				l_assemblies.start
			until
				l_assemblies.after
			loop
				if copy_assemblies.has (l_assemblies.item.cluster_name) then
					copy_assemblies.remove (l_assemblies.item.cluster_name)
				end
				l_assemblies.forth
			end

			-- Insert at the end new clusters.
			if not copy_assemblies.is_empty then
				from
					copy_assemblies.start
				until
					copy_assemblies.after
				loop
					l_assemblies.extend (copy_assemblies.item_for_iteration)
					copy_assemblies.forth
				end
			end

			ace_accesser.apply
		end

feature -- Access
		
	assemblies: IENUM_ASSEMBLY_INTERFACE is
			-- retrieve enum of assemblies
		local
			assem_enum: ASSEMBLY_ENUMERATOR
			assems_array_list: ARRAYED_LIST [ASSEMBLY_PROPERTIES]
			ass_sd: ASSEMBLY_SD
			assembly: ASSEMBLY_PROPERTIES
		do
			create assems_array_list.make (0)
			from
				assemblies_impl.start
			until
				assemblies_impl.after
			loop
				ass_sd := assemblies_impl.item
				if ass_sd.public_key_token /= Void and then not ass_sd.public_key_token.is_empty then
					-- assembly is declared using full assembly name
					create assembly.make (ass_sd.cluster_name, ass_sd.assembly_name, ass_sd.prefix_name, ass_sd.version, ass_sd.culture, ass_sd.public_key_token)	
				else
					-- assembly is declated using path
					create assembly.make_local (ass_sd.cluster_name, ass_sd.assembly_name, ass_sd.prefix_name)
				end
				assems_array_list.extend (assembly)
				assemblies_impl.forth
			end
			create assem_enum.make (assems_array_list)
			Result := assem_enum
		end
		
		
	last_exception: EXCEPTION
			-- last exception to be raised
		
feature -- User Preconditions

	add_assembly_user_precondition (a_prefix, a_cluster_name, a_path: STRING; a_copy: BOOLEAN): BOOLEAN is
		once
			Result := False
		end
		
		
feature -- Validation

	is_valid_eiffel_identifier (a_identifier: STRING): BOOLEAN is
			-- is `a_indentifer' a valid Eiffel identifier?
		require
			non_void_identifier: a_identifier /= Void
			valid_identifier: not a_identifier.is_empty
		local
			l_index: INTEGER
			l_char: CHARACTER
		do
			Result := a_identifier.item (1).is_alpha
			if Result then
				from 
					l_index := 2
				until
					l_index > a_identifier.count or not Result
				loop
					l_char := a_identifier.item (l_index)
					Result := Result and (l_char.is_alpha or l_char.is_digit or l_char = '_')
					l_index := l_index + 1
				end
			end
		end

	is_valid_prefix (a_prefix: STRING): BOOLEAN is
			-- is `a_prefix' a valid prefix
		do
			Result := a_prefix /= Void implies not a_prefix.is_empty
			if Result then
				Result := is_valid_eiffel_identifier (a_prefix)
			end
		end

	is_valid_cluster_name (a_cluster_name: STRING): BOOLEAN is
			-- is `a_cluster_name' a valid cluster name
		do
			Result := a_cluster_name /= Void and not a_cluster_name.is_empty
		end
		
feature {NONE} -- Implementation
	
	ace_accesser: ACE_FILE_ACCESSER
	assemblies_table: HASH_TABLE [ASSEMBLY_SD, STRING]
	assemblies_impl: ARRAYED_LIST [ASSEMBLY_SD]

invariant
	non_void_ace_accesser: ace_accesser /= Void
	non_void_assemblies_table: assemblies_table /= Void

end -- class SYSTEM_ASSEMBLIES
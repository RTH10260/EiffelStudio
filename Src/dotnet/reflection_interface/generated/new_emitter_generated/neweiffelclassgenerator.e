indexing
	Generator: "Eiffel Emitter 2.3b"
	external_name: "EiffelClassGenerator"

external class
	NEWEIFFELCLASSGENERATOR

inherit
	GLOBALS

create
	make_neweiffelclassgenerator

feature {NONE} -- Initialization

	frozen make_neweiffelclassgenerator is
		external
			"IL creator use EiffelClassGenerator"
		end

feature -- Basic Operations

	import_assembly_without_dependancies (assembly: SYSTEM_REFLECTION_ASSEMBLY; path_name: STRING; formatting: BOOLEAN) is
		external
			"IL signature (System.Reflection.Assembly, System.String, System.Boolean): System.Void use EiffelClassGenerator"
		alias
			"ImportAssemblyWithoutDependancies"
		end

	generate_eiffel_classes_from_xml_and_path_name (assembly: SYSTEM_REFLECTION_ASSEMBLY; path_name: STRING) is
		external
			"IL signature (System.Reflection.Assembly, System.String): System.Void use EiffelClassGenerator"
		alias
			"GenerateEiffelClassesFromXmlAndPathName"
		end

	import_assembly_with_dependancies (assembly: SYSTEM_REFLECTION_ASSEMBLY; path_name: STRING; formatting: BOOLEAN) is
		external
			"IL signature (System.Reflection.Assembly, System.String, System.Boolean): System.Void use EiffelClassGenerator"
		alias
			"ImportAssemblyWithDependancies"
		end

	generate_eiffel_classes_from_xml (assembly: SYSTEM_REFLECTION_ASSEMBLY) is
		external
			"IL signature (System.Reflection.Assembly): System.Void use EiffelClassGenerator"
		alias
			"GenerateEiffelClassesFromXml"
		end

	is_assembly_imported (assembly: SYSTEM_REFLECTION_ASSEMBLY): BOOLEAN is
		external
			"IL signature (System.Reflection.Assembly): System.Boolean use EiffelClassGenerator"
		alias
			"IsAssemblyImported"
		end

feature {NONE} -- Implementation

	generated_feature (class_factory: EIFFELCLASSFACTORY; feature_name: STRING; feature_table: SYSTEM_COLLECTIONS_HASHTABLE): ISE_REFLECTION_EIFFELFEATURE is
		external
			"IL signature (EiffelClassFactory, System.String, System.Collections.Hashtable): ISE.Reflection.EiffelFeature use EiffelClassGenerator"
		alias
			"GeneratedFeature"
		end

	prepare_eiffel_code_generation (path_name: STRING) is
		external
			"IL signature (System.String): System.Void use EiffelClassGenerator"
		alias
			"PrepareEiffelCodeGeneration"
		end

	emit_eiffel_classes_from_xml (path_name: STRING) is
		external
			"IL signature (System.String): System.Void use EiffelClassGenerator"
		alias
			"EmitEiffelClassesFromXml"
		end

	emit_from_assembly (assembly: SYSTEM_REFLECTION_ASSEMBLY; path_name: STRING; import_dependancies: BOOLEAN) is
		external
			"IL signature (System.Reflection.Assembly, System.String, System.Boolean): System.Void use EiffelClassGenerator"
		alias
			"EmitFromAssembly"
		end

	generated_class (class_factory: EIFFELCLASSFACTORY): ISE_REFLECTION_EIFFELCLASS is
		external
			"IL signature (EiffelClassFactory): ISE.Reflection.EiffelClass use EiffelClassGenerator"
		alias
			"GeneratedClass"
		end

	is_eiffel_path_valid: BOOLEAN is
		external
			"IL signature (): System.Boolean use EiffelClassGenerator"
		alias
			"IsEiffelPathValid"
		end

	emit_eiffel_classes (path_name: STRING) is
		external
			"IL signature (System.String): System.Void use EiffelClassGenerator"
		alias
			"EmitEiffelClasses"
		end

	emit_xml_files (path_name: STRING) is
		external
			"IL signature (System.String): System.Void use EiffelClassGenerator"
		alias
			"EmitXmlFiles"
		end

	generated_assembly_factory (assembly_type: SYSTEM_TYPE): ISE_REFLECTION_EIFFELASSEMBLYFACTORY is
		external
			"IL signature (System.Type): ISE.Reflection.EiffelAssemblyFactory use EiffelClassGenerator"
		alias
			"GeneratedAssemblyFactory"
		end

end -- class NEWEIFFELCLASSGENERATOR

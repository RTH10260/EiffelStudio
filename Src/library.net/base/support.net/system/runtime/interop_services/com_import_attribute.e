indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Runtime.InteropServices.ComImportAttribute"
	assembly: "mscorlib", "1.0.3300.0", "neutral", "b77a5c561934e089"

frozen external class
	COM_IMPORT_ATTRIBUTE

inherit
	ATTRIBUTE

create
	make_com_import_attribute

feature {NONE} -- Initialization

	frozen make_com_import_attribute is
		external
			"IL creator use System.Runtime.InteropServices.ComImportAttribute"
		end

end -- class COM_IMPORT_ATTRIBUTE

indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Runtime.Remoting.Contexts.IDynamicProperty"
	assembly: "mscorlib", "1.0.3300.0", "neutral", "b77a5c561934e089"

deferred external class
	IDYNAMIC_PROPERTY

inherit
	SYSTEM_OBJECT
		undefine
			finalize,
			get_hash_code,
			equals,
			to_string
		end

feature -- Access

	get_name: SYSTEM_STRING is
		external
			"IL deferred signature (): System.String use System.Runtime.Remoting.Contexts.IDynamicProperty"
		alias
			"get_Name"
		end

end -- class IDYNAMIC_PROPERTY

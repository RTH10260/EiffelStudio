indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Collections.IHashCodeProvider"
	assembly: "mscorlib", "1.0.3300.0", "neutral", "b77a5c561934e089"

deferred external class
	IHASH_CODE_PROVIDER

inherit
	SYSTEM_OBJECT
		undefine
			finalize,
			get_hash_code,
			equals,
			to_string
		end

feature -- Basic Operations

	get_hash_code_object (obj: SYSTEM_OBJECT): INTEGER is
		external
			"IL deferred signature (System.Object): System.Int32 use System.Collections.IHashCodeProvider"
		alias
			"GetHashCode"
		end

end -- class IHASH_CODE_PROVIDER

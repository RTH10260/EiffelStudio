indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
	assembly: "mscorlib", "1.0.3300.0", "neutral", "b77a5c561934e089"

frozen external class
	SOAP_NORMALIZED_STRING

inherit
	SYSTEM_OBJECT
		redefine
			finalize,
			get_hash_code,
			equals,
			to_string
		end
	ISOAP_XSD
		rename
			get_xsd_type as get_xsd_type_string
		end

create
	make,
	make_1

feature {NONE} -- Initialization

	frozen make is
		external
			"IL creator use System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
		end

	frozen make_1 (value: SYSTEM_STRING) is
		external
			"IL creator signature (System.String) use System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
		end

feature -- Access

	frozen get_value: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
		alias
			"get_Value"
		end

	frozen get_xsd_type: SYSTEM_STRING is
		external
			"IL static signature (): System.String use System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
		alias
			"get_XsdType"
		end

feature -- Element Change

	frozen set_value (value: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
		alias
			"set_Value"
		end

feature -- Basic Operations

	get_hash_code: INTEGER is
		external
			"IL signature (): System.Int32 use System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
		alias
			"GetHashCode"
		end

	frozen get_xsd_type_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
		alias
			"GetXsdType"
		end

	to_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
		alias
			"ToString"
		end

	equals (obj: SYSTEM_OBJECT): BOOLEAN is
		external
			"IL signature (System.Object): System.Boolean use System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
		alias
			"Equals"
		end

	frozen parse (value: SYSTEM_STRING): SOAP_NORMALIZED_STRING is
		external
			"IL static signature (System.String): System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString use System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
		alias
			"Parse"
		end

feature {NONE} -- Implementation

	finalize is
		external
			"IL signature (): System.Void use System.Runtime.Remoting.Metadata.W3cXsd2001.SoapNormalizedString"
		alias
			"Finalize"
		end

end -- class SOAP_NORMALIZED_STRING

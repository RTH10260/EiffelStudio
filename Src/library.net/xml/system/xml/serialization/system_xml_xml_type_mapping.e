indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Xml.Serialization.XmlTypeMapping"
	assembly: "System.Xml", "1.0.3300.0", "neutral", "b77a5c561934e089"

external class
	SYSTEM_XML_XML_TYPE_MAPPING

inherit
	SYSTEM_XML_XML_MAPPING

create {NONE}

feature -- Access

	frozen get_type_full_name: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Xml.Serialization.XmlTypeMapping"
		alias
			"get_TypeFullName"
		end

	frozen get_element_name: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Xml.Serialization.XmlTypeMapping"
		alias
			"get_ElementName"
		end

	frozen get_type_name: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Xml.Serialization.XmlTypeMapping"
		alias
			"get_TypeName"
		end

	frozen get_namespace: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Xml.Serialization.XmlTypeMapping"
		alias
			"get_Namespace"
		end

end -- class SYSTEM_XML_XML_TYPE_MAPPING

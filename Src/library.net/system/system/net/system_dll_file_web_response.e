indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Net.FileWebResponse"
	assembly: "System", "1.0.3300.0", "neutral", "b77a5c561934e089"

external class
	SYSTEM_DLL_FILE_WEB_RESPONSE

inherit
	SYSTEM_DLL_WEB_RESPONSE
		redefine
			get_headers,
			get_response_uri,
			get_response_stream,
			get_content_type,
			get_content_length,
			close
		end
	ISERIALIZABLE
		rename
			get_object_data as system_runtime_serialization_iserializable_get_object_data_serialization_info_streaming_context
		select
			system_runtime_serialization_iserializable_get_object_data_serialization_info_streaming_context
		end
	IDISPOSABLE
		rename
			dispose as system_idisposable_dispose_void
		select
			system_idisposable_dispose_void
		end

create {NONE}

feature -- Access

	get_headers: SYSTEM_DLL_WEB_HEADER_COLLECTION is
		external
			"IL signature (): System.Net.WebHeaderCollection use System.Net.FileWebResponse"
		alias
			"get_Headers"
		end

	get_response_uri: SYSTEM_DLL_URI is
		external
			"IL signature (): System.Uri use System.Net.FileWebResponse"
		alias
			"get_ResponseUri"
		end

	get_content_type: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Net.FileWebResponse"
		alias
			"get_ContentType"
		end

	get_content_length: INTEGER_64 is
		external
			"IL signature (): System.Int64 use System.Net.FileWebResponse"
		alias
			"get_ContentLength"
		end

feature -- Basic Operations

	get_response_stream: SYSTEM_STREAM is
		external
			"IL signature (): System.IO.Stream use System.Net.FileWebResponse"
		alias
			"GetResponseStream"
		end

	close is
		external
			"IL signature (): System.Void use System.Net.FileWebResponse"
		alias
			"Close"
		end

feature {NONE} -- Implementation

	dispose (disposing: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Net.FileWebResponse"
		alias
			"Dispose"
		end

	frozen system_runtime_serialization_iserializable_get_object_data_serialization_info_streaming_context (serialization_info: SERIALIZATION_INFO; streaming_context: STREAMING_CONTEXT) is
		external
			"IL signature (System.Runtime.Serialization.SerializationInfo, System.Runtime.Serialization.StreamingContext): System.Void use System.Net.FileWebResponse"
		alias
			"System.Runtime.Serialization.ISerializable.GetObjectData"
		end

	frozen system_idisposable_dispose_void is
		external
			"IL signature (): System.Void use System.Net.FileWebResponse"
		alias
			"System.IDisposable.Dispose"
		end

end -- class SYSTEM_DLL_FILE_WEB_RESPONSE

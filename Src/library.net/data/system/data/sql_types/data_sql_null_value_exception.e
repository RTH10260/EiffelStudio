indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Data.SqlTypes.SqlNullValueException"
	assembly: "System.Data", "1.0.3300.0", "neutral", "b77a5c561934e089"

frozen external class
	DATA_SQL_NULL_VALUE_EXCEPTION

inherit
	DATA_SQL_TYPE_EXCEPTION
	ISERIALIZABLE
		rename
			get_object_data as system_runtime_serialization_iserializable_get_object_data_serialization_info_streaming_context
		select
			system_runtime_serialization_iserializable_get_object_data_serialization_info_streaming_context
		end

create
	make_data_sql_null_value_exception_1,
	make_data_sql_null_value_exception

feature {NONE} -- Initialization

	frozen make_data_sql_null_value_exception_1 (message: SYSTEM_STRING) is
		external
			"IL creator signature (System.String) use System.Data.SqlTypes.SqlNullValueException"
		end

	frozen make_data_sql_null_value_exception is
		external
			"IL creator use System.Data.SqlTypes.SqlNullValueException"
		end

feature {NONE} -- Implementation

	frozen system_runtime_serialization_iserializable_get_object_data_serialization_info_streaming_context (si: SERIALIZATION_INFO; context: STREAMING_CONTEXT) is
		external
			"IL signature (System.Runtime.Serialization.SerializationInfo, System.Runtime.Serialization.StreamingContext): System.Void use System.Data.SqlTypes.SqlNullValueException"
		alias
			"System.Runtime.Serialization.ISerializable.GetObjectData"
		end

end -- class DATA_SQL_NULL_VALUE_EXCEPTION

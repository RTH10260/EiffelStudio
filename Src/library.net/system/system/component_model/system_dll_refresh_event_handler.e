indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.ComponentModel.RefreshEventHandler"
	assembly: "System", "1.0.3300.0", "neutral", "b77a5c561934e089"

frozen external class
	SYSTEM_DLL_REFRESH_EVENT_HANDLER

inherit
	MULTICAST_DELEGATE
	ICLONEABLE
	ISERIALIZABLE

create
	make_system_dll_refresh_event_handler

feature {NONE} -- Initialization

	frozen make_system_dll_refresh_event_handler (object: SYSTEM_OBJECT; method: POINTER) is
		external
			"IL creator signature (System.Object, System.IntPtr) use System.ComponentModel.RefreshEventHandler"
		end

feature -- Basic Operations

	begin_invoke (e: SYSTEM_DLL_REFRESH_EVENT_ARGS; callback: ASYNC_CALLBACK; object: SYSTEM_OBJECT): IASYNC_RESULT is
		external
			"IL signature (System.ComponentModel.RefreshEventArgs, System.AsyncCallback, System.Object): System.IAsyncResult use System.ComponentModel.RefreshEventHandler"
		alias
			"BeginInvoke"
		end

	end_invoke (result_: IASYNC_RESULT) is
		external
			"IL signature (System.IAsyncResult): System.Void use System.ComponentModel.RefreshEventHandler"
		alias
			"EndInvoke"
		end

	invoke (e: SYSTEM_DLL_REFRESH_EVENT_ARGS) is
		external
			"IL signature (System.ComponentModel.RefreshEventArgs): System.Void use System.ComponentModel.RefreshEventHandler"
		alias
			"Invoke"
		end

end -- class SYSTEM_DLL_REFRESH_EVENT_HANDLER

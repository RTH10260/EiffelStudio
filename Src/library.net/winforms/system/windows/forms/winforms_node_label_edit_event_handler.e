indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Windows.Forms.NodeLabelEditEventHandler"
	assembly: "System.Windows.Forms", "1.0.3300.0", "neutral", "b77a5c561934e089"

frozen external class
	WINFORMS_NODE_LABEL_EDIT_EVENT_HANDLER

inherit
	MULTICAST_DELEGATE
	ICLONEABLE
	ISERIALIZABLE

create
	make_winforms_node_label_edit_event_handler

feature {NONE} -- Initialization

	frozen make_winforms_node_label_edit_event_handler (object: SYSTEM_OBJECT; method: POINTER) is
		external
			"IL creator signature (System.Object, System.IntPtr) use System.Windows.Forms.NodeLabelEditEventHandler"
		end

feature -- Basic Operations

	begin_invoke (sender: SYSTEM_OBJECT; e: WINFORMS_NODE_LABEL_EDIT_EVENT_ARGS; callback: ASYNC_CALLBACK; object: SYSTEM_OBJECT): IASYNC_RESULT is
		external
			"IL signature (System.Object, System.Windows.Forms.NodeLabelEditEventArgs, System.AsyncCallback, System.Object): System.IAsyncResult use System.Windows.Forms.NodeLabelEditEventHandler"
		alias
			"BeginInvoke"
		end

	end_invoke (result_: IASYNC_RESULT) is
		external
			"IL signature (System.IAsyncResult): System.Void use System.Windows.Forms.NodeLabelEditEventHandler"
		alias
			"EndInvoke"
		end

	invoke (sender: SYSTEM_OBJECT; e: WINFORMS_NODE_LABEL_EDIT_EVENT_ARGS) is
		external
			"IL signature (System.Object, System.Windows.Forms.NodeLabelEditEventArgs): System.Void use System.Windows.Forms.NodeLabelEditEventHandler"
		alias
			"Invoke"
		end

end -- class WINFORMS_NODE_LABEL_EDIT_EVENT_HANDLER

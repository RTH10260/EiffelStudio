indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Web.UI.WebControls.LinkButton"
	assembly: "System.Web", "1.0.3300.0", "neutral", "b03f5f7f11d5a3a"

external class
	WEB_LINK_BUTTON

inherit
	WEB_WEB_CONTROL
		redefine
			render_contents,
			add_attributes_to_render,
			on_pre_render,
			load_view_state,
			add_parsed_sub_object
		end
	SYSTEM_DLL_ICOMPONENT
	IDISPOSABLE
	WEB_IPARSER_ACCESSOR
		rename
			add_parsed_sub_object as system_web_ui_iparser_accessor_add_parsed_sub_object
		end
	WEB_IDATA_BINDINGS_ACCESSOR
		rename
			get_data_bindings as system_web_ui_idata_bindings_accessor_get_data_bindings,
			get_has_data_bindings as system_web_ui_idata_bindings_accessor_get_has_data_bindings
		end
	WEB_IATTRIBUTE_ACCESSOR
		rename
			set_attribute as system_web_ui_iattribute_accessor_set_attribute,
			get_attribute as system_web_ui_iattribute_accessor_get_attribute
		end
	WEB_IPOST_BACK_EVENT_HANDLER
		rename
			raise_post_back_event as system_web_ui_ipost_back_event_handler_raise_post_back_event
		end

create
	make_web_link_button

feature {NONE} -- Initialization

	frozen make_web_link_button is
		external
			"IL creator use System.Web.UI.WebControls.LinkButton"
		end

feature -- Access

	frozen get_command_name: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Web.UI.WebControls.LinkButton"
		alias
			"get_CommandName"
		end

	get_text: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Web.UI.WebControls.LinkButton"
		alias
			"get_Text"
		end

	frozen get_causes_validation: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Web.UI.WebControls.LinkButton"
		alias
			"get_CausesValidation"
		end

	frozen get_command_argument: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Web.UI.WebControls.LinkButton"
		alias
			"get_CommandArgument"
		end

feature -- Element Change

	set_text (value: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"set_Text"
		end

	frozen add_command (value: WEB_COMMAND_EVENT_HANDLER) is
		external
			"IL signature (System.Web.UI.WebControls.CommandEventHandler): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"add_Command"
		end

	frozen set_command_name (value: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"set_CommandName"
		end

	frozen set_command_argument (value: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"set_CommandArgument"
		end

	frozen remove_click (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"remove_Click"
		end

	frozen add_click (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"add_Click"
		end

	frozen set_causes_validation (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"set_CausesValidation"
		end

	frozen remove_command (value: WEB_COMMAND_EVENT_HANDLER) is
		external
			"IL signature (System.Web.UI.WebControls.CommandEventHandler): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"remove_Command"
		end

feature {NONE} -- Implementation

	frozen system_web_ui_ipost_back_event_handler_raise_post_back_event (event_argument: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"System.Web.UI.IPostBackEventHandler.RaisePostBackEvent"
		end

	add_parsed_sub_object (obj: SYSTEM_OBJECT) is
		external
			"IL signature (System.Object): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"AddParsedSubObject"
		end

	load_view_state (saved_state: SYSTEM_OBJECT) is
		external
			"IL signature (System.Object): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"LoadViewState"
		end

	on_click (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"OnClick"
		end

	on_pre_render (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"OnPreRender"
		end

	on_command (e: WEB_COMMAND_EVENT_ARGS) is
		external
			"IL signature (System.Web.UI.WebControls.CommandEventArgs): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"OnCommand"
		end

	render_contents (writer: WEB_HTML_TEXT_WRITER) is
		external
			"IL signature (System.Web.UI.HtmlTextWriter): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"RenderContents"
		end

	add_attributes_to_render (writer: WEB_HTML_TEXT_WRITER) is
		external
			"IL signature (System.Web.UI.HtmlTextWriter): System.Void use System.Web.UI.WebControls.LinkButton"
		alias
			"AddAttributesToRender"
		end

end -- class WEB_LINK_BUTTON

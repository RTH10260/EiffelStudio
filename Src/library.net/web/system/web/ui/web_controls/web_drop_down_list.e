indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Web.UI.WebControls.DropDownList"
	assembly: "System.Web", "1.0.3300.0", "neutral", "b03f5f7f11d5a3a"

external class
	WEB_DROP_DOWN_LIST

inherit
	WEB_LIST_CONTROL
		redefine
			set_selected_index,
			get_selected_index,
			render_contents,
			add_attributes_to_render,
			set_tool_tip,
			get_tool_tip,
			set_border_style,
			get_border_style,
			set_border_width,
			get_border_width,
			set_border_color,
			get_border_color,
			create_control_collection
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
	WEB_IPOST_BACK_DATA_HANDLER
		rename
			raise_post_data_changed_event as system_web_ui_ipost_back_data_handler_raise_post_data_changed_event,
			load_post_data as system_web_ui_ipost_back_data_handler_load_post_data
		end

create
	make_web_drop_down_list

feature {NONE} -- Initialization

	frozen make_web_drop_down_list is
		external
			"IL creator use System.Web.UI.WebControls.DropDownList"
		end

feature -- Access

	get_selected_index: INTEGER is
		external
			"IL signature (): System.Int32 use System.Web.UI.WebControls.DropDownList"
		alias
			"get_SelectedIndex"
		end

	get_tool_tip: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Web.UI.WebControls.DropDownList"
		alias
			"get_ToolTip"
		end

	get_border_width: WEB_UNIT is
		external
			"IL signature (): System.Web.UI.WebControls.Unit use System.Web.UI.WebControls.DropDownList"
		alias
			"get_BorderWidth"
		end

	get_border_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Web.UI.WebControls.DropDownList"
		alias
			"get_BorderColor"
		end

	get_border_style: WEB_BORDER_STYLE is
		external
			"IL signature (): System.Web.UI.WebControls.BorderStyle use System.Web.UI.WebControls.DropDownList"
		alias
			"get_BorderStyle"
		end

feature -- Element Change

	set_tool_tip (value: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Web.UI.WebControls.DropDownList"
		alias
			"set_ToolTip"
		end

	set_border_style (value: WEB_BORDER_STYLE) is
		external
			"IL signature (System.Web.UI.WebControls.BorderStyle): System.Void use System.Web.UI.WebControls.DropDownList"
		alias
			"set_BorderStyle"
		end

	set_border_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Web.UI.WebControls.DropDownList"
		alias
			"set_BorderColor"
		end

	set_selected_index (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Web.UI.WebControls.DropDownList"
		alias
			"set_SelectedIndex"
		end

	set_border_width (value: WEB_UNIT) is
		external
			"IL signature (System.Web.UI.WebControls.Unit): System.Void use System.Web.UI.WebControls.DropDownList"
		alias
			"set_BorderWidth"
		end

feature {NONE} -- Implementation

	frozen system_web_ui_ipost_back_data_handler_load_post_data (post_data_key: SYSTEM_STRING; post_collection: SYSTEM_DLL_NAME_VALUE_COLLECTION): BOOLEAN is
		external
			"IL signature (System.String, System.Collections.Specialized.NameValueCollection): System.Boolean use System.Web.UI.WebControls.DropDownList"
		alias
			"System.Web.UI.IPostBackDataHandler.LoadPostData"
		end

	frozen system_web_ui_ipost_back_data_handler_raise_post_data_changed_event is
		external
			"IL signature (): System.Void use System.Web.UI.WebControls.DropDownList"
		alias
			"System.Web.UI.IPostBackDataHandler.RaisePostDataChangedEvent"
		end

	render_contents (writer: WEB_HTML_TEXT_WRITER) is
		external
			"IL signature (System.Web.UI.HtmlTextWriter): System.Void use System.Web.UI.WebControls.DropDownList"
		alias
			"RenderContents"
		end

	create_control_collection: WEB_CONTROL_COLLECTION is
		external
			"IL signature (): System.Web.UI.ControlCollection use System.Web.UI.WebControls.DropDownList"
		alias
			"CreateControlCollection"
		end

	add_attributes_to_render (writer: WEB_HTML_TEXT_WRITER) is
		external
			"IL signature (System.Web.UI.HtmlTextWriter): System.Void use System.Web.UI.WebControls.DropDownList"
		alias
			"AddAttributesToRender"
		end

end -- class WEB_DROP_DOWN_LIST

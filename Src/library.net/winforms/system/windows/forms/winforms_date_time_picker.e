indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Windows.Forms.DateTimePicker"
	assembly: "System.Windows.Forms", "1.0.3300.0", "neutral", "b77a5c561934e089"

external class
	WINFORMS_DATE_TIME_PICKER

inherit
	WINFORMS_CONTROL
		redefine
			wnd_proc,
			set_bounds_core,
			on_system_colors_changed,
			on_font_changed,
			is_input_key,
			destroy_handle,
			create_handle,
			create_accessibility_instance,
			set_text,
			get_text,
			set_fore_color,
			get_fore_color,
			get_default_size,
			get_create_params,
			set_background_image,
			get_background_image,
			set_back_color,
			get_back_color,
			to_string
		end
	SYSTEM_DLL_ICOMPONENT
	IDISPOSABLE
	SYSTEM_DLL_ISYNCHRONIZE_INVOKE
		rename
			invoke as invoke_delegate_array_object,
			begin_invoke as begin_invoke_delegate_array_object
		end
	WINFORMS_IWIN32_WINDOW

create
	make_winforms_date_time_picker

feature {NONE} -- Initialization

	frozen make_winforms_date_time_picker is
		external
			"IL creator use System.Windows.Forms.DateTimePicker"
		end

feature -- Access

	frozen get_show_up_down: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.DateTimePicker"
		alias
			"get_ShowUpDown"
		end

	frozen min_date_time: SYSTEM_DATE_TIME is
		external
			"IL static_field signature :System.DateTime use System.Windows.Forms.DateTimePicker"
		alias
			"MinDateTime"
		end

	frozen get_preferred_height: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.DateTimePicker"
		alias
			"get_PreferredHeight"
		end

	get_text: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Windows.Forms.DateTimePicker"
		alias
			"get_Text"
		end

	frozen get_show_check_box: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.DateTimePicker"
		alias
			"get_ShowCheckBox"
		end

	frozen get_calendar_title_back_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.DateTimePicker"
		alias
			"get_CalendarTitleBackColor"
		end

	frozen get_calendar_fore_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.DateTimePicker"
		alias
			"get_CalendarForeColor"
		end

	frozen get_calendar_month_background: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.DateTimePicker"
		alias
			"get_CalendarMonthBackground"
		end

	frozen get_checked: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.DateTimePicker"
		alias
			"get_Checked"
		end

	frozen get_drop_down_align: WINFORMS_LEFT_RIGHT_ALIGNMENT is
		external
			"IL signature (): System.Windows.Forms.LeftRightAlignment use System.Windows.Forms.DateTimePicker"
		alias
			"get_DropDownAlign"
		end

	get_fore_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.DateTimePicker"
		alias
			"get_ForeColor"
		end

	frozen max_date_time: SYSTEM_DATE_TIME is
		external
			"IL static_field signature :System.DateTime use System.Windows.Forms.DateTimePicker"
		alias
			"MaxDateTime"
		end

	frozen get_value: SYSTEM_DATE_TIME is
		external
			"IL signature (): System.DateTime use System.Windows.Forms.DateTimePicker"
		alias
			"get_Value"
		end

	get_back_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.DateTimePicker"
		alias
			"get_BackColor"
		end

	frozen get_calendar_title_fore_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.DateTimePicker"
		alias
			"get_CalendarTitleForeColor"
		end

	get_background_image: DRAWING_IMAGE is
		external
			"IL signature (): System.Drawing.Image use System.Windows.Forms.DateTimePicker"
		alias
			"get_BackgroundImage"
		end

	frozen get_format: WINFORMS_DATE_TIME_PICKER_FORMAT is
		external
			"IL signature (): System.Windows.Forms.DateTimePickerFormat use System.Windows.Forms.DateTimePicker"
		alias
			"get_Format"
		end

	frozen get_max_date: SYSTEM_DATE_TIME is
		external
			"IL signature (): System.DateTime use System.Windows.Forms.DateTimePicker"
		alias
			"get_MaxDate"
		end

	frozen get_calendar_trailing_fore_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.DateTimePicker"
		alias
			"get_CalendarTrailingForeColor"
		end

	frozen get_custom_format: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Windows.Forms.DateTimePicker"
		alias
			"get_CustomFormat"
		end

	frozen get_min_date: SYSTEM_DATE_TIME is
		external
			"IL signature (): System.DateTime use System.Windows.Forms.DateTimePicker"
		alias
			"get_MinDate"
		end

	frozen get_calendar_font: DRAWING_FONT is
		external
			"IL signature (): System.Drawing.Font use System.Windows.Forms.DateTimePicker"
		alias
			"get_CalendarFont"
		end

feature -- Element Change

	frozen set_calendar_month_background (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_CalendarMonthBackground"
		end

	frozen set_value (value: SYSTEM_DATE_TIME) is
		external
			"IL signature (System.DateTime): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_Value"
		end

	set_back_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_BackColor"
		end

	frozen set_drop_down_align (value: WINFORMS_LEFT_RIGHT_ALIGNMENT) is
		external
			"IL signature (System.Windows.Forms.LeftRightAlignment): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_DropDownAlign"
		end

	frozen remove_paint_paint_event_handler (value: WINFORMS_PAINT_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.PaintEventHandler): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"remove_Paint"
		end

	frozen set_min_date (value: SYSTEM_DATE_TIME) is
		external
			"IL signature (System.DateTime): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_MinDate"
		end

	frozen set_calendar_trailing_fore_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_CalendarTrailingForeColor"
		end

	frozen set_calendar_title_back_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_CalendarTitleBackColor"
		end

	frozen remove_value_changed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"remove_ValueChanged"
		end

	frozen set_show_check_box (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_ShowCheckBox"
		end

	frozen remove_close_up (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"remove_CloseUp"
		end

	frozen set_calendar_fore_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_CalendarForeColor"
		end

	frozen set_show_up_down (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_ShowUpDown"
		end

	set_fore_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_ForeColor"
		end

	frozen add_paint_paint_event_handler (value: WINFORMS_PAINT_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.PaintEventHandler): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"add_Paint"
		end

	frozen remove_format_changed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"remove_FormatChanged"
		end

	frozen add_drop_down (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"add_DropDown"
		end

	frozen set_max_date (value: SYSTEM_DATE_TIME) is
		external
			"IL signature (System.DateTime): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_MaxDate"
		end

	frozen add_close_up (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"add_CloseUp"
		end

	set_text (value: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_Text"
		end

	frozen set_checked (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_Checked"
		end

	frozen set_custom_format (value: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_CustomFormat"
		end

	frozen add_value_changed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"add_ValueChanged"
		end

	frozen set_calendar_font (value: DRAWING_FONT) is
		external
			"IL signature (System.Drawing.Font): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_CalendarFont"
		end

	frozen remove_drop_down (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"remove_DropDown"
		end

	frozen set_calendar_title_fore_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_CalendarTitleForeColor"
		end

	frozen set_format (value: WINFORMS_DATE_TIME_PICKER_FORMAT) is
		external
			"IL signature (System.Windows.Forms.DateTimePickerFormat): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_Format"
		end

	frozen add_format_changed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"add_FormatChanged"
		end

	set_background_image (value: DRAWING_IMAGE) is
		external
			"IL signature (System.Drawing.Image): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"set_BackgroundImage"
		end

feature -- Basic Operations

	to_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Windows.Forms.DateTimePicker"
		alias
			"ToString"
		end

feature {NONE} -- Implementation

	get_default_size: DRAWING_SIZE is
		external
			"IL signature (): System.Drawing.Size use System.Windows.Forms.DateTimePicker"
		alias
			"get_DefaultSize"
		end

	on_font_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"OnFontChanged"
		end

	get_create_params: WINFORMS_CREATE_PARAMS is
		external
			"IL signature (): System.Windows.Forms.CreateParams use System.Windows.Forms.DateTimePicker"
		alias
			"get_CreateParams"
		end

	create_handle is
		external
			"IL signature (): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"CreateHandle"
		end

	on_value_changed (eventargs: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"OnValueChanged"
		end

	set_bounds_core (x: INTEGER; y: INTEGER; width: INTEGER; height: INTEGER; specified: WINFORMS_BOUNDS_SPECIFIED) is
		external
			"IL signature (System.Int32, System.Int32, System.Int32, System.Int32, System.Windows.Forms.BoundsSpecified): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"SetBoundsCore"
		end

	on_format_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"OnFormatChanged"
		end

	destroy_handle is
		external
			"IL signature (): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"DestroyHandle"
		end

	on_close_up (eventargs: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"OnCloseUp"
		end

	on_drop_down (eventargs: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"OnDropDown"
		end

	on_system_colors_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"OnSystemColorsChanged"
		end

	wnd_proc (m: WINFORMS_MESSAGE) is
		external
			"IL signature (System.Windows.Forms.Message&): System.Void use System.Windows.Forms.DateTimePicker"
		alias
			"WndProc"
		end

	create_accessibility_instance: WINFORMS_ACCESSIBLE_OBJECT is
		external
			"IL signature (): System.Windows.Forms.AccessibleObject use System.Windows.Forms.DateTimePicker"
		alias
			"CreateAccessibilityInstance"
		end

	is_input_key (key_data: WINFORMS_KEYS): BOOLEAN is
		external
			"IL signature (System.Windows.Forms.Keys): System.Boolean use System.Windows.Forms.DateTimePicker"
		alias
			"IsInputKey"
		end

end -- class WINFORMS_DATE_TIME_PICKER

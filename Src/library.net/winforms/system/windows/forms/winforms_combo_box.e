indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Windows.Forms.ComboBox"
	assembly: "System.Windows.Forms", "1.0.3300.0", "neutral", "b77a5c561934e089"

external class
	WINFORMS_COMBO_BOX

inherit
	WINFORMS_LIST_CONTROL
		redefine
			set_item_core,
			on_selected_index_changed,
			on_display_member_changed,
			on_data_source_changed,
			wnd_proc,
			set_bounds_core,
			on_resize,
			on_key_press,
			on_handle_destroyed,
			on_handle_created,
			on_parent_back_color_changed,
			on_fore_color_changed,
			on_font_changed,
			on_back_color_changed,
			is_input_key,
			set_text,
			get_text,
			set_fore_color,
			get_fore_color,
			get_focused,
			get_default_size,
			get_create_params,
			set_background_image,
			get_background_image,
			set_back_color,
			get_back_color,
			dispose_boolean,
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
	make_winforms_combo_box

feature {NONE} -- Initialization

	frozen make_winforms_combo_box is
		external
			"IL creator use System.Windows.Forms.ComboBox"
		end

feature -- Access

	frozen get_sorted: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ComboBox"
		alias
			"get_Sorted"
		end

	frozen get_selection_start: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"get_SelectionStart"
		end

	frozen get_preferred_height: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"get_PreferredHeight"
		end

	frozen get_item_height: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"get_ItemHeight"
		end

	frozen get_dropped_down: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ComboBox"
		alias
			"get_DroppedDown"
		end

	frozen get_selected_item: SYSTEM_OBJECT is
		external
			"IL signature (): System.Object use System.Windows.Forms.ComboBox"
		alias
			"get_SelectedItem"
		end

	get_text: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Windows.Forms.ComboBox"
		alias
			"get_Text"
		end

	get_focused: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ComboBox"
		alias
			"get_Focused"
		end

	frozen get_drop_down_style: WINFORMS_COMBO_BOX_STYLE is
		external
			"IL signature (): System.Windows.Forms.ComboBoxStyle use System.Windows.Forms.ComboBox"
		alias
			"get_DropDownStyle"
		end

	frozen get_draw_mode: WINFORMS_DRAW_MODE is
		external
			"IL signature (): System.Windows.Forms.DrawMode use System.Windows.Forms.ComboBox"
		alias
			"get_DrawMode"
		end

	frozen get_integral_height: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ComboBox"
		alias
			"get_IntegralHeight"
		end

	frozen get_items: WINFORMS_OBJECT_COLLECTION_IN_WINFORMS_COMBO_BOX is
		external
			"IL signature (): System.Windows.Forms.ComboBox+ObjectCollection use System.Windows.Forms.ComboBox"
		alias
			"get_Items"
		end

	get_fore_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.ComboBox"
		alias
			"get_ForeColor"
		end

	get_back_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.ComboBox"
		alias
			"get_BackColor"
		end

	frozen get_max_drop_down_items: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"get_MaxDropDownItems"
		end

	get_background_image: DRAWING_IMAGE is
		external
			"IL signature (): System.Drawing.Image use System.Windows.Forms.ComboBox"
		alias
			"get_BackgroundImage"
		end

	frozen get_selected_text: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Windows.Forms.ComboBox"
		alias
			"get_SelectedText"
		end

	frozen get_max_length: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"get_MaxLength"
		end

	frozen get_selection_length: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"get_SelectionLength"
		end

	frozen get_drop_down_width: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"get_DropDownWidth"
		end

	get_selected_index: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"get_SelectedIndex"
		end

feature -- Element Change

	frozen set_integral_height (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_IntegralHeight"
		end

	frozen set_selection_start (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_SelectionStart"
		end

	set_back_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_BackColor"
		end

	frozen remove_drop_down_style_changed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"remove_DropDownStyleChanged"
		end

	set_selected_index (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_SelectedIndex"
		end

	frozen set_selected_text (value: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_SelectedText"
		end

	frozen add_drop_down (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"add_DropDown"
		end

	frozen set_sorted (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_Sorted"
		end

	frozen remove_selected_index_changed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"remove_SelectedIndexChanged"
		end

	frozen add_drop_down_style_changed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"add_DropDownStyleChanged"
		end

	frozen set_draw_mode (value: WINFORMS_DRAW_MODE) is
		external
			"IL signature (System.Windows.Forms.DrawMode): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_DrawMode"
		end

	frozen set_max_length (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_MaxLength"
		end

	frozen add_selected_index_changed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"add_SelectedIndexChanged"
		end

	frozen remove_measure_item (value: WINFORMS_MEASURE_ITEM_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.MeasureItemEventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"remove_MeasureItem"
		end

	frozen set_max_drop_down_items (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_MaxDropDownItems"
		end

	frozen add_measure_item (value: WINFORMS_MEASURE_ITEM_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.MeasureItemEventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"add_MeasureItem"
		end

	frozen remove_paint_paint_event_handler (value: WINFORMS_PAINT_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.PaintEventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"remove_Paint"
		end

	set_fore_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_ForeColor"
		end

	frozen set_selected_item (value: SYSTEM_OBJECT) is
		external
			"IL signature (System.Object): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_SelectedItem"
		end

	frozen set_dropped_down (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_DroppedDown"
		end

	frozen set_selection_length (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_SelectionLength"
		end

	frozen remove_selection_change_committed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"remove_SelectionChangeCommitted"
		end

	frozen set_item_height (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_ItemHeight"
		end

	frozen add_paint_paint_event_handler (value: WINFORMS_PAINT_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.PaintEventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"add_Paint"
		end

	frozen set_drop_down_style (value: WINFORMS_COMBO_BOX_STYLE) is
		external
			"IL signature (System.Windows.Forms.ComboBoxStyle): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_DropDownStyle"
		end

	set_text (value: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_Text"
		end

	frozen remove_drop_down (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"remove_DropDown"
		end

	frozen set_drop_down_width (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_DropDownWidth"
		end

	frozen add_draw_item (value: WINFORMS_DRAW_ITEM_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.DrawItemEventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"add_DrawItem"
		end

	frozen remove_draw_item (value: WINFORMS_DRAW_ITEM_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.DrawItemEventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"remove_DrawItem"
		end

	frozen add_selection_change_committed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ComboBox"
		alias
			"add_SelectionChangeCommitted"
		end

	set_background_image (value: DRAWING_IMAGE) is
		external
			"IL signature (System.Drawing.Image): System.Void use System.Windows.Forms.ComboBox"
		alias
			"set_BackgroundImage"
		end

feature -- Basic Operations

	to_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Windows.Forms.ComboBox"
		alias
			"ToString"
		end

	frozen select__int32 (start: INTEGER; length: INTEGER) is
		external
			"IL signature (System.Int32, System.Int32): System.Void use System.Windows.Forms.ComboBox"
		alias
			"Select"
		end

	frozen get_item_height_int32 (index: INTEGER): INTEGER is
		external
			"IL signature (System.Int32): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"GetItemHeight"
		end

	frozen end_update is
		external
			"IL signature (): System.Void use System.Windows.Forms.ComboBox"
		alias
			"EndUpdate"
		end

	frozen find_string_exact_string_int32 (s: SYSTEM_STRING; start_index: INTEGER): INTEGER is
		external
			"IL signature (System.String, System.Int32): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"FindStringExact"
		end

	frozen begin_update is
		external
			"IL signature (): System.Void use System.Windows.Forms.ComboBox"
		alias
			"BeginUpdate"
		end

	frozen find_string_exact (s: SYSTEM_STRING): INTEGER is
		external
			"IL signature (System.String): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"FindStringExact"
		end

	frozen select_all is
		external
			"IL signature (): System.Void use System.Windows.Forms.ComboBox"
		alias
			"SelectAll"
		end

	frozen find_string_string_int32 (s: SYSTEM_STRING; start_index: INTEGER): INTEGER is
		external
			"IL signature (System.String, System.Int32): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"FindString"
		end

	frozen find_string (s: SYSTEM_STRING): INTEGER is
		external
			"IL signature (System.String): System.Int32 use System.Windows.Forms.ComboBox"
		alias
			"FindString"
		end

feature {NONE} -- Implementation

	refresh_item (index: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ComboBox"
		alias
			"RefreshItem"
		end

	on_selected_index_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnSelectedIndexChanged"
		end

	get_create_params: WINFORMS_CREATE_PARAMS is
		external
			"IL signature (): System.Windows.Forms.CreateParams use System.Windows.Forms.ComboBox"
		alias
			"get_CreateParams"
		end

	wnd_proc (m: WINFORMS_MESSAGE) is
		external
			"IL signature (System.Windows.Forms.Message&): System.Void use System.Windows.Forms.ComboBox"
		alias
			"WndProc"
		end

	on_drop_down_style_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnDropDownStyleChanged"
		end

	on_drop_down (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnDropDown"
		end

	dispose_boolean (disposing: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.ComboBox"
		alias
			"Dispose"
		end

	on_handle_created (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnHandleCreated"
		end

	on_back_color_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnBackColorChanged"
		end

	on_selection_change_committed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnSelectionChangeCommitted"
		end

	get_default_size: DRAWING_SIZE is
		external
			"IL signature (): System.Drawing.Size use System.Windows.Forms.ComboBox"
		alias
			"get_DefaultSize"
		end

	add_items_core (value: NATIVE_ARRAY [SYSTEM_OBJECT]) is
		external
			"IL signature (System.Object[]): System.Void use System.Windows.Forms.ComboBox"
		alias
			"AddItemsCore"
		end

	on_resize (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnResize"
		end

	on_selected_item_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnSelectedItemChanged"
		end

	on_draw_item (e: WINFORMS_DRAW_ITEM_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.DrawItemEventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnDrawItem"
		end

	on_data_source_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnDataSourceChanged"
		end

	on_fore_color_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnForeColorChanged"
		end

	set_item_core (index: INTEGER; value: SYSTEM_OBJECT) is
		external
			"IL signature (System.Int32, System.Object): System.Void use System.Windows.Forms.ComboBox"
		alias
			"SetItemCore"
		end

	on_parent_back_color_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnParentBackColorChanged"
		end

	set_items_core (value: ILIST) is
		external
			"IL signature (System.Collections.IList): System.Void use System.Windows.Forms.ComboBox"
		alias
			"SetItemsCore"
		end

	on_font_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnFontChanged"
		end

	on_key_press (e: WINFORMS_KEY_PRESS_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.KeyPressEventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnKeyPress"
		end

	on_display_member_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnDisplayMemberChanged"
		end

	on_handle_destroyed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnHandleDestroyed"
		end

	set_bounds_core (x: INTEGER; y: INTEGER; width: INTEGER; height: INTEGER; specified: WINFORMS_BOUNDS_SPECIFIED) is
		external
			"IL signature (System.Int32, System.Int32, System.Int32, System.Int32, System.Windows.Forms.BoundsSpecified): System.Void use System.Windows.Forms.ComboBox"
		alias
			"SetBoundsCore"
		end

	is_input_key (key_data: WINFORMS_KEYS): BOOLEAN is
		external
			"IL signature (System.Windows.Forms.Keys): System.Boolean use System.Windows.Forms.ComboBox"
		alias
			"IsInputKey"
		end

	on_measure_item (e: WINFORMS_MEASURE_ITEM_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.MeasureItemEventArgs): System.Void use System.Windows.Forms.ComboBox"
		alias
			"OnMeasureItem"
		end

end -- class WINFORMS_COMBO_BOX

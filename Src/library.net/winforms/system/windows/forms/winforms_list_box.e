indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Windows.Forms.ListBox"
	assembly: "System.Windows.Forms", "1.0.3300.0", "neutral", "b77a5c561934e089"

external class
	WINFORMS_LIST_BOX

inherit
	WINFORMS_LIST_CONTROL
		redefine
			set_item_core,
			on_selected_index_changed,
			on_display_member_changed,
			on_data_source_changed,
			wnd_proc,
			set_bounds_core,
			on_change_uicues,
			on_resize,
			on_handle_destroyed,
			on_handle_created,
			on_parent_changed,
			on_font_changed,
			set_text,
			get_text,
			set_right_to_left,
			get_right_to_left,
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
	make_winforms_list_box

feature {NONE} -- Initialization

	frozen make_winforms_list_box is
		external
			"IL creator use System.Windows.Forms.ListBox"
		end

feature -- Access

	frozen get_sorted: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ListBox"
		alias
			"get_Sorted"
		end

	frozen no_matches: INTEGER is 0xffffffff

	get_selection_mode: WINFORMS_SELECTION_MODE is
		external
			"IL signature (): System.Windows.Forms.SelectionMode use System.Windows.Forms.ListBox"
		alias
			"get_SelectionMode"
		end

	get_item_height: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"get_ItemHeight"
		end

	frozen default_item_height: INTEGER is 0xd

	frozen get_preferred_height: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"get_PreferredHeight"
		end

	get_text: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Windows.Forms.ListBox"
		alias
			"get_Text"
		end

	frozen get_border_style: WINFORMS_BORDER_STYLE is
		external
			"IL signature (): System.Windows.Forms.BorderStyle use System.Windows.Forms.ListBox"
		alias
			"get_BorderStyle"
		end

	frozen get_selected_item: SYSTEM_OBJECT is
		external
			"IL signature (): System.Object use System.Windows.Forms.ListBox"
		alias
			"get_SelectedItem"
		end

	get_draw_mode: WINFORMS_DRAW_MODE is
		external
			"IL signature (): System.Windows.Forms.DrawMode use System.Windows.Forms.ListBox"
		alias
			"get_DrawMode"
		end

	frozen get_integral_height: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ListBox"
		alias
			"get_IntegralHeight"
		end

	frozen get_selected_indices: WINFORMS_SELECTED_INDEX_COLLECTION_IN_WINFORMS_LIST_BOX is
		external
			"IL signature (): System.Windows.Forms.ListBox+SelectedIndexCollection use System.Windows.Forms.ListBox"
		alias
			"get_SelectedIndices"
		end

	frozen get_items: WINFORMS_OBJECT_COLLECTION_IN_WINFORMS_LIST_BOX is
		external
			"IL signature (): System.Windows.Forms.ListBox+ObjectCollection use System.Windows.Forms.ListBox"
		alias
			"get_Items"
		end

	get_fore_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.ListBox"
		alias
			"get_ForeColor"
		end

	frozen get_scroll_always_visible: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ListBox"
		alias
			"get_ScrollAlwaysVisible"
		end

	get_back_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.ListBox"
		alias
			"get_BackColor"
		end

	frozen get_horizontal_scrollbar: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ListBox"
		alias
			"get_HorizontalScrollbar"
		end

	frozen get_use_tab_stops: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ListBox"
		alias
			"get_UseTabStops"
		end

	get_background_image: DRAWING_IMAGE is
		external
			"IL signature (): System.Drawing.Image use System.Windows.Forms.ListBox"
		alias
			"get_BackgroundImage"
		end

	frozen get_horizontal_extent: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"get_HorizontalExtent"
		end

	frozen get_top_index: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"get_TopIndex"
		end

	frozen get_column_width: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"get_ColumnWidth"
		end

	frozen get_multi_column: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ListBox"
		alias
			"get_MultiColumn"
		end

	frozen get_selected_items: WINFORMS_SELECTED_OBJECT_COLLECTION_IN_WINFORMS_LIST_BOX is
		external
			"IL signature (): System.Windows.Forms.ListBox+SelectedObjectCollection use System.Windows.Forms.ListBox"
		alias
			"get_SelectedItems"
		end

	get_right_to_left: WINFORMS_RIGHT_TO_LEFT is
		external
			"IL signature (): System.Windows.Forms.RightToLeft use System.Windows.Forms.ListBox"
		alias
			"get_RightToLeft"
		end

	get_selected_index: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"get_SelectedIndex"
		end

feature -- Element Change

	frozen set_integral_height (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_IntegralHeight"
		end

	frozen set_selected_item (value: SYSTEM_OBJECT) is
		external
			"IL signature (System.Object): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_SelectedItem"
		end

	frozen add_click_event_handler (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ListBox"
		alias
			"add_Click"
		end

	frozen set_column_width (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_ColumnWidth"
		end

	set_fore_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_ForeColor"
		end

	set_back_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_BackColor"
		end

	frozen set_horizontal_scrollbar (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_HorizontalScrollbar"
		end

	set_right_to_left (value: WINFORMS_RIGHT_TO_LEFT) is
		external
			"IL signature (System.Windows.Forms.RightToLeft): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_RightToLeft"
		end

	frozen set_sorted (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_Sorted"
		end

	frozen remove_selected_index_changed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ListBox"
		alias
			"remove_SelectedIndexChanged"
		end

	set_draw_mode (value: WINFORMS_DRAW_MODE) is
		external
			"IL signature (System.Windows.Forms.DrawMode): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_DrawMode"
		end

	frozen remove_paint_paint_event_handler (value: WINFORMS_PAINT_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.PaintEventHandler): System.Void use System.Windows.Forms.ListBox"
		alias
			"remove_Paint"
		end

	frozen add_selected_index_changed (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ListBox"
		alias
			"add_SelectedIndexChanged"
		end

	frozen remove_measure_item (value: WINFORMS_MEASURE_ITEM_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.MeasureItemEventHandler): System.Void use System.Windows.Forms.ListBox"
		alias
			"remove_MeasureItem"
		end

	set_text (value: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_Text"
		end

	set_selected_index (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_SelectedIndex"
		end

	set_selection_mode (value: WINFORMS_SELECTION_MODE) is
		external
			"IL signature (System.Windows.Forms.SelectionMode): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_SelectionMode"
		end

	frozen set_multi_column (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_MultiColumn"
		end

	frozen set_horizontal_extent (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_HorizontalExtent"
		end

	frozen set_use_tab_stops (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_UseTabStops"
		end

	frozen remove_click_event_handler (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.ListBox"
		alias
			"remove_Click"
		end

	set_item_height (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_ItemHeight"
		end

	frozen add_paint_paint_event_handler (value: WINFORMS_PAINT_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.PaintEventHandler): System.Void use System.Windows.Forms.ListBox"
		alias
			"add_Paint"
		end

	frozen set_scroll_always_visible (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_ScrollAlwaysVisible"
		end

	frozen add_measure_item (value: WINFORMS_MEASURE_ITEM_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.MeasureItemEventHandler): System.Void use System.Windows.Forms.ListBox"
		alias
			"add_MeasureItem"
		end

	frozen add_draw_item (value: WINFORMS_DRAW_ITEM_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.DrawItemEventHandler): System.Void use System.Windows.Forms.ListBox"
		alias
			"add_DrawItem"
		end

	frozen set_top_index (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_TopIndex"
		end

	frozen remove_draw_item (value: WINFORMS_DRAW_ITEM_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.DrawItemEventHandler): System.Void use System.Windows.Forms.ListBox"
		alias
			"remove_DrawItem"
		end

	frozen set_border_style (value: WINFORMS_BORDER_STYLE) is
		external
			"IL signature (System.Windows.Forms.BorderStyle): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_BorderStyle"
		end

	set_background_image (value: DRAWING_IMAGE) is
		external
			"IL signature (System.Drawing.Image): System.Void use System.Windows.Forms.ListBox"
		alias
			"set_BackgroundImage"
		end

feature -- Basic Operations

	to_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Windows.Forms.ListBox"
		alias
			"ToString"
		end

	frozen get_item_height_int32 (index: INTEGER): INTEGER is
		external
			"IL signature (System.Int32): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"GetItemHeight"
		end

	frozen end_update is
		external
			"IL signature (): System.Void use System.Windows.Forms.ListBox"
		alias
			"EndUpdate"
		end

	frozen find_string_exact_string_int32 (s: SYSTEM_STRING; start_index: INTEGER): INTEGER is
		external
			"IL signature (System.String, System.Int32): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"FindStringExact"
		end

	frozen clear_selected is
		external
			"IL signature (): System.Void use System.Windows.Forms.ListBox"
		alias
			"ClearSelected"
		end

	frozen get_selected (index: INTEGER): BOOLEAN is
		external
			"IL signature (System.Int32): System.Boolean use System.Windows.Forms.ListBox"
		alias
			"GetSelected"
		end

	frozen index_from_point_int32 (x: INTEGER; y: INTEGER): INTEGER is
		external
			"IL signature (System.Int32, System.Int32): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"IndexFromPoint"
		end

	frozen set_selected (index: INTEGER; value: BOOLEAN) is
		external
			"IL signature (System.Int32, System.Boolean): System.Void use System.Windows.Forms.ListBox"
		alias
			"SetSelected"
		end

	frozen begin_update is
		external
			"IL signature (): System.Void use System.Windows.Forms.ListBox"
		alias
			"BeginUpdate"
		end

	frozen get_item_rectangle (index: INTEGER): DRAWING_RECTANGLE is
		external
			"IL signature (System.Int32): System.Drawing.Rectangle use System.Windows.Forms.ListBox"
		alias
			"GetItemRectangle"
		end

	frozen find_string_exact (s: SYSTEM_STRING): INTEGER is
		external
			"IL signature (System.String): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"FindStringExact"
		end

	frozen index_from_point (p: DRAWING_POINT): INTEGER is
		external
			"IL signature (System.Drawing.Point): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"IndexFromPoint"
		end

	frozen find_string_string_int32 (s: SYSTEM_STRING; start_index: INTEGER): INTEGER is
		external
			"IL signature (System.String, System.Int32): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"FindString"
		end

	frozen find_string (s: SYSTEM_STRING): INTEGER is
		external
			"IL signature (System.String): System.Int32 use System.Windows.Forms.ListBox"
		alias
			"FindString"
		end

feature {NONE} -- Implementation

	on_change_uicues (e: WINFORMS_UICUES_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.UICuesEventArgs): System.Void use System.Windows.Forms.ListBox"
		alias
			"OnChangeUICues"
		end

	refresh_item (index: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ListBox"
		alias
			"RefreshItem"
		end

	on_selected_index_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ListBox"
		alias
			"OnSelectedIndexChanged"
		end

	get_create_params: WINFORMS_CREATE_PARAMS is
		external
			"IL signature (): System.Windows.Forms.CreateParams use System.Windows.Forms.ListBox"
		alias
			"get_CreateParams"
		end

	sort is
		external
			"IL signature (): System.Void use System.Windows.Forms.ListBox"
		alias
			"Sort"
		end

	wnd_proc (m: WINFORMS_MESSAGE) is
		external
			"IL signature (System.Windows.Forms.Message&): System.Void use System.Windows.Forms.ListBox"
		alias
			"WndProc"
		end

	on_parent_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ListBox"
		alias
			"OnParentChanged"
		end

	wm_reflect_command (m: WINFORMS_MESSAGE) is
		external
			"IL signature (System.Windows.Forms.Message&): System.Void use System.Windows.Forms.ListBox"
		alias
			"WmReflectCommand"
		end

	on_handle_created (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ListBox"
		alias
			"OnHandleCreated"
		end

	get_default_size: DRAWING_SIZE is
		external
			"IL signature (): System.Drawing.Size use System.Windows.Forms.ListBox"
		alias
			"get_DefaultSize"
		end

	add_items_core (value: NATIVE_ARRAY [SYSTEM_OBJECT]) is
		external
			"IL signature (System.Object[]): System.Void use System.Windows.Forms.ListBox"
		alias
			"AddItemsCore"
		end

	on_resize (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ListBox"
		alias
			"OnResize"
		end

	on_draw_item (e: WINFORMS_DRAW_ITEM_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.DrawItemEventArgs): System.Void use System.Windows.Forms.ListBox"
		alias
			"OnDrawItem"
		end

	set_bounds_core (x: INTEGER; y: INTEGER; width: INTEGER; height: INTEGER; specified: WINFORMS_BOUNDS_SPECIFIED) is
		external
			"IL signature (System.Int32, System.Int32, System.Int32, System.Int32, System.Windows.Forms.BoundsSpecified): System.Void use System.Windows.Forms.ListBox"
		alias
			"SetBoundsCore"
		end

	on_data_source_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ListBox"
		alias
			"OnDataSourceChanged"
		end

	set_item_core (index: INTEGER; value: SYSTEM_OBJECT) is
		external
			"IL signature (System.Int32, System.Object): System.Void use System.Windows.Forms.ListBox"
		alias
			"SetItemCore"
		end

	set_items_core (value: ILIST) is
		external
			"IL signature (System.Collections.IList): System.Void use System.Windows.Forms.ListBox"
		alias
			"SetItemsCore"
		end

	on_font_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ListBox"
		alias
			"OnFontChanged"
		end

	on_display_member_changed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ListBox"
		alias
			"OnDisplayMemberChanged"
		end

	on_handle_destroyed (e: EVENT_ARGS) is
		external
			"IL signature (System.EventArgs): System.Void use System.Windows.Forms.ListBox"
		alias
			"OnHandleDestroyed"
		end

	create_item_collection: WINFORMS_OBJECT_COLLECTION_IN_WINFORMS_LIST_BOX is
		external
			"IL signature (): System.Windows.Forms.ListBox+ObjectCollection use System.Windows.Forms.ListBox"
		alias
			"CreateItemCollection"
		end

	on_measure_item (e: WINFORMS_MEASURE_ITEM_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.MeasureItemEventArgs): System.Void use System.Windows.Forms.ListBox"
		alias
			"OnMeasureItem"
		end

end -- class WINFORMS_LIST_BOX

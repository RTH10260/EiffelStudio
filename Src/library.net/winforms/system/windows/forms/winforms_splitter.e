indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Windows.Forms.Splitter"
	assembly: "System.Windows.Forms", "1.0.3300.0", "neutral", "b77a5c561934e089"

external class
	WINFORMS_SPLITTER

inherit
	WINFORMS_CONTROL
		redefine
			set_bounds_core,
			on_mouse_up,
			on_mouse_move,
			on_mouse_down,
			on_key_down,
			set_text,
			get_text,
			set_fore_color,
			get_fore_color,
			set_font,
			get_font,
			set_dock,
			get_dock,
			get_default_size,
			get_default_ime_mode,
			get_create_params,
			set_background_image,
			get_background_image,
			set_anchor,
			get_anchor,
			set_allow_drop,
			get_allow_drop,
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
	WINFORMS_IMESSAGE_FILTER

create
	make_winforms_splitter

feature {NONE} -- Initialization

	frozen make_winforms_splitter is
		external
			"IL creator use System.Windows.Forms.Splitter"
		end

feature -- Access

	frozen get_min_extra: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.Splitter"
		alias
			"get_MinExtra"
		end

	get_background_image: DRAWING_IMAGE is
		external
			"IL signature (): System.Drawing.Image use System.Windows.Forms.Splitter"
		alias
			"get_BackgroundImage"
		end

	get_font: DRAWING_FONT is
		external
			"IL signature (): System.Drawing.Font use System.Windows.Forms.Splitter"
		alias
			"get_Font"
		end

	get_allow_drop: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.Splitter"
		alias
			"get_AllowDrop"
		end

	get_dock: WINFORMS_DOCK_STYLE is
		external
			"IL signature (): System.Windows.Forms.DockStyle use System.Windows.Forms.Splitter"
		alias
			"get_Dock"
		end

	frozen get_min_size: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.Splitter"
		alias
			"get_MinSize"
		end

	get_text: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Windows.Forms.Splitter"
		alias
			"get_Text"
		end

	frozen get_ime_mode_ime_mode: WINFORMS_IME_MODE is
		external
			"IL signature (): System.Windows.Forms.ImeMode use System.Windows.Forms.Splitter"
		alias
			"get_ImeMode"
		end

	frozen get_border_style: WINFORMS_BORDER_STYLE is
		external
			"IL signature (): System.Windows.Forms.BorderStyle use System.Windows.Forms.Splitter"
		alias
			"get_BorderStyle"
		end

	frozen get_tab_stop_boolean: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.Splitter"
		alias
			"get_TabStop"
		end

	get_fore_color: DRAWING_COLOR is
		external
			"IL signature (): System.Drawing.Color use System.Windows.Forms.Splitter"
		alias
			"get_ForeColor"
		end

	get_anchor: WINFORMS_ANCHOR_STYLES is
		external
			"IL signature (): System.Windows.Forms.AnchorStyles use System.Windows.Forms.Splitter"
		alias
			"get_Anchor"
		end

	frozen get_split_position: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.Splitter"
		alias
			"get_SplitPosition"
		end

feature -- Element Change

	frozen set_min_size (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_MinSize"
		end

	set_allow_drop (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_AllowDrop"
		end

	frozen remove_splitter_moved (value: WINFORMS_SPLITTER_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.SplitterEventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"remove_SplitterMoved"
		end

	frozen add_splitter_moved (value: WINFORMS_SPLITTER_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.SplitterEventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"add_SplitterMoved"
		end

	frozen remove_splitter_moving (value: WINFORMS_SPLITTER_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.SplitterEventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"remove_SplitterMoving"
		end

	set_anchor (value: WINFORMS_ANCHOR_STYLES) is
		external
			"IL signature (System.Windows.Forms.AnchorStyles): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_Anchor"
		end

	set_font (value: DRAWING_FONT) is
		external
			"IL signature (System.Drawing.Font): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_Font"
		end

	frozen remove_enter_event_handler (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"remove_Enter"
		end

	frozen set_split_position (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_SplitPosition"
		end

	frozen set_border_style (value: WINFORMS_BORDER_STYLE) is
		external
			"IL signature (System.Windows.Forms.BorderStyle): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_BorderStyle"
		end

	frozen set_tab_stop_boolean (value: BOOLEAN) is
		external
			"IL signature (System.Boolean): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_TabStop"
		end

	frozen add_key_press_key_press_event_handler (value: WINFORMS_KEY_PRESS_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.KeyPressEventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"add_KeyPress"
		end

	frozen add_splitter_moving (value: WINFORMS_SPLITTER_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.SplitterEventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"add_SplitterMoving"
		end

	frozen add_key_down_key_event_handler (value: WINFORMS_KEY_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.KeyEventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"add_KeyDown"
		end

	frozen remove_leave_event_handler (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"remove_Leave"
		end

	set_fore_color (value: DRAWING_COLOR) is
		external
			"IL signature (System.Drawing.Color): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_ForeColor"
		end

	frozen remove_key_down_key_event_handler (value: WINFORMS_KEY_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.KeyEventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"remove_KeyDown"
		end

	frozen add_leave_event_handler (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"add_Leave"
		end

	frozen set_min_extra (value: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_MinExtra"
		end

	set_dock (value: WINFORMS_DOCK_STYLE) is
		external
			"IL signature (System.Windows.Forms.DockStyle): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_Dock"
		end

	frozen remove_key_press_key_press_event_handler (value: WINFORMS_KEY_PRESS_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.KeyPressEventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"remove_KeyPress"
		end

	set_text (value: SYSTEM_STRING) is
		external
			"IL signature (System.String): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_Text"
		end

	frozen add_key_up_key_event_handler (value: WINFORMS_KEY_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.KeyEventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"add_KeyUp"
		end

	frozen remove_key_up_key_event_handler (value: WINFORMS_KEY_EVENT_HANDLER) is
		external
			"IL signature (System.Windows.Forms.KeyEventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"remove_KeyUp"
		end

	frozen set_ime_mode_ime_mode (value: WINFORMS_IME_MODE) is
		external
			"IL signature (System.Windows.Forms.ImeMode): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_ImeMode"
		end

	frozen add_enter_event_handler (value: EVENT_HANDLER) is
		external
			"IL signature (System.EventHandler): System.Void use System.Windows.Forms.Splitter"
		alias
			"add_Enter"
		end

	set_background_image (value: DRAWING_IMAGE) is
		external
			"IL signature (System.Drawing.Image): System.Void use System.Windows.Forms.Splitter"
		alias
			"set_BackgroundImage"
		end

feature -- Basic Operations

	frozen pre_filter_message (m: WINFORMS_MESSAGE): BOOLEAN is
		external
			"IL signature (System.Windows.Forms.Message&): System.Boolean use System.Windows.Forms.Splitter"
		alias
			"PreFilterMessage"
		end

	to_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Windows.Forms.Splitter"
		alias
			"ToString"
		end

feature {NONE} -- Implementation

	get_default_size: DRAWING_SIZE is
		external
			"IL signature (): System.Drawing.Size use System.Windows.Forms.Splitter"
		alias
			"get_DefaultSize"
		end

	get_create_params: WINFORMS_CREATE_PARAMS is
		external
			"IL signature (): System.Windows.Forms.CreateParams use System.Windows.Forms.Splitter"
		alias
			"get_CreateParams"
		end

	on_splitter_moving (sevent: WINFORMS_SPLITTER_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.SplitterEventArgs): System.Void use System.Windows.Forms.Splitter"
		alias
			"OnSplitterMoving"
		end

	on_mouse_move (e: WINFORMS_MOUSE_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.MouseEventArgs): System.Void use System.Windows.Forms.Splitter"
		alias
			"OnMouseMove"
		end

	set_bounds_core (x: INTEGER; y: INTEGER; width: INTEGER; height: INTEGER; specified: WINFORMS_BOUNDS_SPECIFIED) is
		external
			"IL signature (System.Int32, System.Int32, System.Int32, System.Int32, System.Windows.Forms.BoundsSpecified): System.Void use System.Windows.Forms.Splitter"
		alias
			"SetBoundsCore"
		end

	get_default_ime_mode: WINFORMS_IME_MODE is
		external
			"IL signature (): System.Windows.Forms.ImeMode use System.Windows.Forms.Splitter"
		alias
			"get_DefaultImeMode"
		end

	on_splitter_moved (sevent: WINFORMS_SPLITTER_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.SplitterEventArgs): System.Void use System.Windows.Forms.Splitter"
		alias
			"OnSplitterMoved"
		end

	on_mouse_up (e: WINFORMS_MOUSE_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.MouseEventArgs): System.Void use System.Windows.Forms.Splitter"
		alias
			"OnMouseUp"
		end

	on_key_down (e: WINFORMS_KEY_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.KeyEventArgs): System.Void use System.Windows.Forms.Splitter"
		alias
			"OnKeyDown"
		end

	on_mouse_down (e: WINFORMS_MOUSE_EVENT_ARGS) is
		external
			"IL signature (System.Windows.Forms.MouseEventArgs): System.Void use System.Windows.Forms.Splitter"
		alias
			"OnMouseDown"
		end

end -- class WINFORMS_SPLITTER

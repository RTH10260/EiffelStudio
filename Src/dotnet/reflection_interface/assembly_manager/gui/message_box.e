indexing 
	description: "Message box"
	external_name: "ISE.AssemblyManager.MessageBox"

class
	MESSAGE_BOX

inherit
	DIALOG
		redefine
			dictionary
		end
	
create 
	make

feature {NONE} -- Initialization

	make (a_message: STRING; call_back: SYSTEM_EVENTHANDLER) is
		indexing
			description: "Set `message' with `a_message'."
			external_name: "Make"
		require
			non_void_message: a_message /= Void
			not_empty_message: a_message.get_length > 0
			non_void_call_back: call_back /= Void
		local
			returned_value: SYSTEM_WINDOWS_FORMS_DIALOGRESULT
			is_focused: BOOLEAN
			arguments: SYSTEM_EVENTARGS
		do
			make_form
			message := a_message
			initialize_gui	
			show
			is_focused := focus
			create arguments.make
			call_back.invoke (Current, arguments)
		ensure
			message_set: message.equals_string (a_message)
		end

feature -- Access

	message: STRING 
		indexing
			description: "Message"
			external_name: "Message"
		end

	dictionary: MESSAGE_BOX_DICTIONARY is
		indexing
			description: "Dictionary"
			external_name: "Dictionary"
		once
			create Result
		end
		
feature -- Basic Operations

	initialize_gui is
		indexing
			description: "Initialize GUI."
			external_name: "InitializeGui"
		local
			a_size: SYSTEM_DRAWING_SIZE
			a_point: SYSTEM_DRAWING_POINT
			a_font: SYSTEM_DRAWING_FONT
			a_label: SYSTEM_WINDOWS_FORMS_LABEL
			a_panel: SYSTEM_WINDOWS_FORMS_PANEL
			an_image: SYSTEM_DRAWING_IMAGE
			border_style: SYSTEM_WINDOWS_FORMS_FORMBORDERSTYLE
			style: SYSTEM_DRAWING_FONTSTYLE
		do
			set_Enabled (True)
			set_text (dictionary.Title)
			set_border_style (border_style.fixed_single)
			a_size.set_Width (dictionary.Window_width)
			a_size.set_Height (dictionary.Window_height)
			set_size (a_size)	
			set_maximize_box (False)
			set_icon (dictionary.Assembly_manager_icon)	
			
			create message_label.make_label
			a_point.set_x (dictionary.Margin)
			a_point.set_y (2 * dictionary.Margin)
			message_label.set_location (a_point)
			message_label.set_auto_size (True)
			create a_font.make_font_10 (dictionary.Font_family_name, dictionary.Font_size, style.Bold)
			message_label.set_font (a_font)
			message_label.set_text (message)
			get_controls.add (message_label)

			create a_label.make_label
			a_point.set_x (dictionary.Margin)
			a_point.set_y (2 * dictionary.Margin + dictionary.Label_height)
			a_label.set_location (a_point)
			a_label.set_auto_size (True)
			create a_font.make_font_10 (dictionary.Font_family_name, dictionary.Font_size, style.Regular)
			a_label.set_font (a_font)
			a_label.set_text (dictionary.Other_message)
			get_controls.add (a_label)
			
				-- Image
			an_image := image_factory.from_file (dictionary.Watch_icon_filename)
			create a_panel.make_panel
			a_panel.set_height (an_image.get_height)
			a_panel.set_width (an_image.get_width)
			a_panel.set_background_image (an_image)	
			a_point.set_x (dictionary.Window_width - 2 * dictionary.Margin - an_image.get_width)
			a_point.set_y (2 * dictionary.Margin)
			a_panel.set_location (a_point)
			get_controls.add (a_panel)	
		end
		
feature {NONE} -- Implementation

	message_label: SYSTEM_WINDOWS_FORMS_LABEL
		indexing
			description: "Message label"
			external_name: "MessageLabel"
		end

	image_factory: SYSTEM_DRAWING_IMAGE 
		indexing
			description: "Static needed to create images"
			external_name: "ImageFactory"
		end
		
end -- class MESSAGE_BOX

indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Web.UI.WebControls.LinkButtonControlBuilder"
	assembly: "System.Web", "1.0.3300.0", "neutral", "b03f5f7f11d5a3a"

external class
	WEB_LINK_BUTTON_CONTROL_BUILDER

inherit
	WEB_CONTROL_BUILDER
		redefine
			allow_whitespace_literals
		end

create
	make_web_link_button_control_builder

feature {NONE} -- Initialization

	frozen make_web_link_button_control_builder is
		external
			"IL creator use System.Web.UI.WebControls.LinkButtonControlBuilder"
		end

feature -- Basic Operations

	allow_whitespace_literals: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Web.UI.WebControls.LinkButtonControlBuilder"
		alias
			"AllowWhitespaceLiterals"
		end

end -- class WEB_LINK_BUTTON_CONTROL_BUILDER

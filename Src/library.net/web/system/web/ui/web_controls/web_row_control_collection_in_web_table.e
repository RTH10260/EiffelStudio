indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Web.UI.WebControls.Table+RowControlCollection"
	assembly: "System.Web", "1.0.3300.0", "neutral", "b03f5f7f11d5a3a"

external class
	WEB_ROW_CONTROL_COLLECTION_IN_WEB_TABLE

inherit
	WEB_CONTROL_COLLECTION
		redefine
			add_at,
			add
		end
	ICOLLECTION
	IENUMERABLE

create {NONE}

feature -- Basic Operations

	add_at (index: INTEGER; child: WEB_CONTROL) is
		external
			"IL signature (System.Int32, System.Web.UI.Control): System.Void use System.Web.UI.WebControls.Table+RowControlCollection"
		alias
			"AddAt"
		end

	add (child: WEB_CONTROL) is
		external
			"IL signature (System.Web.UI.Control): System.Void use System.Web.UI.WebControls.Table+RowControlCollection"
		alias
			"Add"
		end

end -- class WEB_ROW_CONTROL_COLLECTION_IN_WEB_TABLE

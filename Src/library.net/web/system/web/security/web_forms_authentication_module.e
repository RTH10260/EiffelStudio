indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Web.Security.FormsAuthenticationModule"
	assembly: "System.Web", "1.0.3300.0", "neutral", "b03f5f7f11d5a3a"

frozen external class
	WEB_FORMS_AUTHENTICATION_MODULE

inherit
	SYSTEM_OBJECT
		redefine
			finalize,
			get_hash_code,
			equals,
			to_string
		end
	WEB_IHTTP_MODULE

create
	make

feature {NONE} -- Initialization

	frozen make is
		external
			"IL creator use System.Web.Security.FormsAuthenticationModule"
		end

feature -- Element Change

	frozen remove_authenticate (value: WEB_FORMS_AUTHENTICATION_EVENT_HANDLER) is
		external
			"IL signature (System.Web.Security.FormsAuthenticationEventHandler): System.Void use System.Web.Security.FormsAuthenticationModule"
		alias
			"remove_Authenticate"
		end

	frozen add_authenticate (value: WEB_FORMS_AUTHENTICATION_EVENT_HANDLER) is
		external
			"IL signature (System.Web.Security.FormsAuthenticationEventHandler): System.Void use System.Web.Security.FormsAuthenticationModule"
		alias
			"add_Authenticate"
		end

feature -- Basic Operations

	get_hash_code: INTEGER is
		external
			"IL signature (): System.Int32 use System.Web.Security.FormsAuthenticationModule"
		alias
			"GetHashCode"
		end

	frozen dispose is
		external
			"IL signature (): System.Void use System.Web.Security.FormsAuthenticationModule"
		alias
			"Dispose"
		end

	frozen init (app: WEB_HTTP_APPLICATION) is
		external
			"IL signature (System.Web.HttpApplication): System.Void use System.Web.Security.FormsAuthenticationModule"
		alias
			"Init"
		end

	to_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Web.Security.FormsAuthenticationModule"
		alias
			"ToString"
		end

	equals (obj: SYSTEM_OBJECT): BOOLEAN is
		external
			"IL signature (System.Object): System.Boolean use System.Web.Security.FormsAuthenticationModule"
		alias
			"Equals"
		end

feature {NONE} -- Implementation

	finalize is
		external
			"IL signature (): System.Void use System.Web.Security.FormsAuthenticationModule"
		alias
			"Finalize"
		end

end -- class WEB_FORMS_AUTHENTICATION_MODULE

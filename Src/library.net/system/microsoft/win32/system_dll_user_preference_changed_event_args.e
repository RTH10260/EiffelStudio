indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "Microsoft.Win32.UserPreferenceChangedEventArgs"
	assembly: "System", "1.0.3300.0", "neutral", "b77a5c561934e089"

external class
	SYSTEM_DLL_USER_PREFERENCE_CHANGED_EVENT_ARGS

inherit
	EVENT_ARGS

create
	make_system_dll_user_preference_changed_event_args

feature {NONE} -- Initialization

	frozen make_system_dll_user_preference_changed_event_args (category: SYSTEM_DLL_USER_PREFERENCE_CATEGORY) is
		external
			"IL creator signature (Microsoft.Win32.UserPreferenceCategory) use Microsoft.Win32.UserPreferenceChangedEventArgs"
		end

feature -- Access

	frozen get_category: SYSTEM_DLL_USER_PREFERENCE_CATEGORY is
		external
			"IL signature (): Microsoft.Win32.UserPreferenceCategory use Microsoft.Win32.UserPreferenceChangedEventArgs"
		alias
			"get_Category"
		end

end -- class SYSTEM_DLL_USER_PREFERENCE_CHANGED_EVENT_ARGS

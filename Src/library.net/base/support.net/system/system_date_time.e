indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.DateTime"
	assembly: "mscorlib", "1.0.3300.0", "neutral", "b77a5c561934e089"

frozen expanded external class
	SYSTEM_DATE_TIME

inherit
	VALUE_TYPE
		redefine
			get_hash_code,
			equals,
			to_string
		end
	ICOMPARABLE
	IFORMATTABLE

feature -- Initialization

	frozen make_system_date_time_4 (year: INTEGER; month: INTEGER; day: INTEGER; hour: INTEGER; minute: INTEGER; second: INTEGER; calendar: CALENDAR) is
		external
			"IL creator signature (System.Int32, System.Int32, System.Int32, System.Int32, System.Int32, System.Int32, System.Globalization.Calendar) use System.DateTime"
		end

	frozen make_system_date_time_5 (year: INTEGER; month: INTEGER; day: INTEGER; hour: INTEGER; minute: INTEGER; second: INTEGER; millisecond: INTEGER) is
		external
			"IL creator signature (System.Int32, System.Int32, System.Int32, System.Int32, System.Int32, System.Int32, System.Int32) use System.DateTime"
		end

	frozen make_system_date_time_6 (year: INTEGER; month: INTEGER; day: INTEGER; hour: INTEGER; minute: INTEGER; second: INTEGER; millisecond: INTEGER; calendar: CALENDAR) is
		external
			"IL creator signature (System.Int32, System.Int32, System.Int32, System.Int32, System.Int32, System.Int32, System.Int32, System.Globalization.Calendar) use System.DateTime"
		end

	frozen make_system_date_time (ticks: INTEGER_64) is
		external
			"IL creator signature (System.Int64) use System.DateTime"
		end

	frozen make_system_date_time_1 (year: INTEGER; month: INTEGER; day: INTEGER) is
		external
			"IL creator signature (System.Int32, System.Int32, System.Int32) use System.DateTime"
		end

	frozen make_system_date_time_2 (year: INTEGER; month: INTEGER; day: INTEGER; calendar: CALENDAR) is
		external
			"IL creator signature (System.Int32, System.Int32, System.Int32, System.Globalization.Calendar) use System.DateTime"
		end

	frozen make_system_date_time_3 (year: INTEGER; month: INTEGER; day: INTEGER; hour: INTEGER; minute: INTEGER; second: INTEGER) is
		external
			"IL creator signature (System.Int32, System.Int32, System.Int32, System.Int32, System.Int32, System.Int32) use System.DateTime"
		end

feature -- Access

	frozen get_utc_now: SYSTEM_DATE_TIME is
		external
			"IL static signature (): System.DateTime use System.DateTime"
		alias
			"get_UtcNow"
		end

	frozen get_second: INTEGER is
		external
			"IL signature (): System.Int32 use System.DateTime"
		alias
			"get_Second"
		end

	frozen get_month: INTEGER is
		external
			"IL signature (): System.Int32 use System.DateTime"
		alias
			"get_Month"
		end

	frozen get_day_of_year: INTEGER is
		external
			"IL signature (): System.Int32 use System.DateTime"
		alias
			"get_DayOfYear"
		end

	frozen get_date: SYSTEM_DATE_TIME is
		external
			"IL signature (): System.DateTime use System.DateTime"
		alias
			"get_Date"
		end

	frozen get_ticks: INTEGER_64 is
		external
			"IL signature (): System.Int64 use System.DateTime"
		alias
			"get_Ticks"
		end

	frozen get_time_of_day: TIME_SPAN is
		external
			"IL signature (): System.TimeSpan use System.DateTime"
		alias
			"get_TimeOfDay"
		end

	frozen get_millisecond: INTEGER is
		external
			"IL signature (): System.Int32 use System.DateTime"
		alias
			"get_Millisecond"
		end

	frozen get_now: SYSTEM_DATE_TIME is
		external
			"IL static signature (): System.DateTime use System.DateTime"
		alias
			"get_Now"
		end

	frozen get_today: SYSTEM_DATE_TIME is
		external
			"IL static signature (): System.DateTime use System.DateTime"
		alias
			"get_Today"
		end

	frozen get_hour: INTEGER is
		external
			"IL signature (): System.Int32 use System.DateTime"
		alias
			"get_Hour"
		end

	frozen min_value: SYSTEM_DATE_TIME is
		external
			"IL static_field signature :System.DateTime use System.DateTime"
		alias
			"MinValue"
		end

	frozen get_minute: INTEGER is
		external
			"IL signature (): System.Int32 use System.DateTime"
		alias
			"get_Minute"
		end

	frozen max_value: SYSTEM_DATE_TIME is
		external
			"IL static_field signature :System.DateTime use System.DateTime"
		alias
			"MaxValue"
		end

	frozen get_year: INTEGER is
		external
			"IL signature (): System.Int32 use System.DateTime"
		alias
			"get_Year"
		end

	frozen get_day_of_week: DAY_OF_WEEK is
		external
			"IL signature (): System.DayOfWeek use System.DateTime"
		alias
			"get_DayOfWeek"
		end

	frozen get_day: INTEGER is
		external
			"IL signature (): System.Int32 use System.DateTime"
		alias
			"get_Day"
		end

feature -- Basic Operations

	get_hash_code: INTEGER is
		external
			"IL signature (): System.Int32 use System.DateTime"
		alias
			"GetHashCode"
		end

	to_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.DateTime"
		alias
			"ToString"
		end

	frozen get_date_time_formats: NATIVE_ARRAY [SYSTEM_STRING] is
		external
			"IL signature (): System.String[] use System.DateTime"
		alias
			"GetDateTimeFormats"
		end

	frozen to_universal_time: SYSTEM_DATE_TIME is
		external
			"IL signature (): System.DateTime use System.DateTime"
		alias
			"ToUniversalTime"
		end

	frozen add_months (months: INTEGER): SYSTEM_DATE_TIME is
		external
			"IL signature (System.Int32): System.DateTime use System.DateTime"
		alias
			"AddMonths"
		end

	frozen add_years (value: INTEGER): SYSTEM_DATE_TIME is
		external
			"IL signature (System.Int32): System.DateTime use System.DateTime"
		alias
			"AddYears"
		end

	frozen to_string_string2 (format: SYSTEM_STRING): SYSTEM_STRING is
		external
			"IL signature (System.String): System.String use System.DateTime"
		alias
			"ToString"
		end

	frozen to_oadate: DOUBLE is
		external
			"IL signature (): System.Double use System.DateTime"
		alias
			"ToOADate"
		end

	frozen to_string_iformat_provider (provider: IFORMAT_PROVIDER): SYSTEM_STRING is
		external
			"IL signature (System.IFormatProvider): System.String use System.DateTime"
		alias
			"ToString"
		end

	frozen to_short_time_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.DateTime"
		alias
			"ToShortTimeString"
		end

	frozen parse (s: SYSTEM_STRING): SYSTEM_DATE_TIME is
		external
			"IL static signature (System.String): System.DateTime use System.DateTime"
		alias
			"Parse"
		end

	frozen from_oadate (d: DOUBLE): SYSTEM_DATE_TIME is
		external
			"IL static signature (System.Double): System.DateTime use System.DateTime"
		alias
			"FromOADate"
		end

	frozen parse_exact (s: SYSTEM_STRING; format: SYSTEM_STRING; provider: IFORMAT_PROVIDER): SYSTEM_DATE_TIME is
		external
			"IL static signature (System.String, System.String, System.IFormatProvider): System.DateTime use System.DateTime"
		alias
			"ParseExact"
		end

	frozen parse_exact_string_string_iformat_provider_date_time_styles (s: SYSTEM_STRING; format: SYSTEM_STRING; provider: IFORMAT_PROVIDER; style: DATE_TIME_STYLES): SYSTEM_DATE_TIME is
		external
			"IL static signature (System.String, System.String, System.IFormatProvider, System.Globalization.DateTimeStyles): System.DateTime use System.DateTime"
		alias
			"ParseExact"
		end

	frozen to_local_time: SYSTEM_DATE_TIME is
		external
			"IL signature (): System.DateTime use System.DateTime"
		alias
			"ToLocalTime"
		end

	equals (value: SYSTEM_OBJECT): BOOLEAN is
		external
			"IL signature (System.Object): System.Boolean use System.DateTime"
		alias
			"Equals"
		end

	frozen subtract_date_time (value: SYSTEM_DATE_TIME): TIME_SPAN is
		external
			"IL signature (System.DateTime): System.TimeSpan use System.DateTime"
		alias
			"Subtract"
		end

	frozen from_file_time (file_time: INTEGER_64): SYSTEM_DATE_TIME is
		external
			"IL static signature (System.Int64): System.DateTime use System.DateTime"
		alias
			"FromFileTime"
		end

	frozen parse_string_iformat_provider_date_time_styles (s: SYSTEM_STRING; provider: IFORMAT_PROVIDER; styles: DATE_TIME_STYLES): SYSTEM_DATE_TIME is
		external
			"IL static signature (System.String, System.IFormatProvider, System.Globalization.DateTimeStyles): System.DateTime use System.DateTime"
		alias
			"Parse"
		end

	frozen is_leap_year (year: INTEGER): BOOLEAN is
		external
			"IL static signature (System.Int32): System.Boolean use System.DateTime"
		alias
			"IsLeapYear"
		end

	frozen to_short_date_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.DateTime"
		alias
			"ToShortDateString"
		end

	frozen get_date_time_formats_char (format: CHARACTER): NATIVE_ARRAY [SYSTEM_STRING] is
		external
			"IL signature (System.Char): System.String[] use System.DateTime"
		alias
			"GetDateTimeFormats"
		end

	frozen add_days (value: DOUBLE): SYSTEM_DATE_TIME is
		external
			"IL signature (System.Double): System.DateTime use System.DateTime"
		alias
			"AddDays"
		end

	frozen to_file_time: INTEGER_64 is
		external
			"IL signature (): System.Int64 use System.DateTime"
		alias
			"ToFileTime"
		end

	frozen add (value: TIME_SPAN): SYSTEM_DATE_TIME is
		external
			"IL signature (System.TimeSpan): System.DateTime use System.DateTime"
		alias
			"Add"
		end

	frozen to_long_time_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.DateTime"
		alias
			"ToLongTimeString"
		end

	frozen add_hours (value: DOUBLE): SYSTEM_DATE_TIME is
		external
			"IL signature (System.Double): System.DateTime use System.DateTime"
		alias
			"AddHours"
		end

	frozen subtract (value: TIME_SPAN): SYSTEM_DATE_TIME is
		external
			"IL signature (System.TimeSpan): System.DateTime use System.DateTime"
		alias
			"Subtract"
		end

	frozen compare (t1: SYSTEM_DATE_TIME; t2: SYSTEM_DATE_TIME): INTEGER is
		external
			"IL static signature (System.DateTime, System.DateTime): System.Int32 use System.DateTime"
		alias
			"Compare"
		end

	frozen add_ticks (value: INTEGER_64): SYSTEM_DATE_TIME is
		external
			"IL signature (System.Int64): System.DateTime use System.DateTime"
		alias
			"AddTicks"
		end

	frozen parse_string_iformat_provider (s: SYSTEM_STRING; provider: IFORMAT_PROVIDER): SYSTEM_DATE_TIME is
		external
			"IL static signature (System.String, System.IFormatProvider): System.DateTime use System.DateTime"
		alias
			"Parse"
		end

	frozen to_string_string (format: SYSTEM_STRING; provider: IFORMAT_PROVIDER): SYSTEM_STRING is
		external
			"IL signature (System.String, System.IFormatProvider): System.String use System.DateTime"
		alias
			"ToString"
		end

	frozen get_type_code: TYPE_CODE is
		external
			"IL signature (): System.TypeCode use System.DateTime"
		alias
			"GetTypeCode"
		end

	frozen add_seconds (value: DOUBLE): SYSTEM_DATE_TIME is
		external
			"IL signature (System.Double): System.DateTime use System.DateTime"
		alias
			"AddSeconds"
		end

	frozen add_minutes (value: DOUBLE): SYSTEM_DATE_TIME is
		external
			"IL signature (System.Double): System.DateTime use System.DateTime"
		alias
			"AddMinutes"
		end

	frozen days_in_month (year: INTEGER; month: INTEGER): INTEGER is
		external
			"IL static signature (System.Int32, System.Int32): System.Int32 use System.DateTime"
		alias
			"DaysInMonth"
		end

	frozen compare_to (value: SYSTEM_OBJECT): INTEGER is
		external
			"IL signature (System.Object): System.Int32 use System.DateTime"
		alias
			"CompareTo"
		end

	frozen add_milliseconds (value: DOUBLE): SYSTEM_DATE_TIME is
		external
			"IL signature (System.Double): System.DateTime use System.DateTime"
		alias
			"AddMilliseconds"
		end

	frozen parse_exact_string_array_string (s: SYSTEM_STRING; formats: NATIVE_ARRAY [SYSTEM_STRING]; provider: IFORMAT_PROVIDER; style: DATE_TIME_STYLES): SYSTEM_DATE_TIME is
		external
			"IL static signature (System.String, System.String[], System.IFormatProvider, System.Globalization.DateTimeStyles): System.DateTime use System.DateTime"
		alias
			"ParseExact"
		end

	frozen to_long_date_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.DateTime"
		alias
			"ToLongDateString"
		end

	frozen get_date_time_formats_iformat_provider (provider: IFORMAT_PROVIDER): NATIVE_ARRAY [SYSTEM_STRING] is
		external
			"IL signature (System.IFormatProvider): System.String[] use System.DateTime"
		alias
			"GetDateTimeFormats"
		end

	frozen get_date_time_formats_char_iformat_provider (format: CHARACTER; provider: IFORMAT_PROVIDER): NATIVE_ARRAY [SYSTEM_STRING] is
		external
			"IL signature (System.Char, System.IFormatProvider): System.String[] use System.DateTime"
		alias
			"GetDateTimeFormats"
		end

	frozen equals_date_time (t1: SYSTEM_DATE_TIME; t2: SYSTEM_DATE_TIME): BOOLEAN is
		external
			"IL static signature (System.DateTime, System.DateTime): System.Boolean use System.DateTime"
		alias
			"Equals"
		end

feature -- Binary Operators

	frozen infix "+" (t: TIME_SPAN): SYSTEM_DATE_TIME is
		external
			"IL operator signature (System.TimeSpan): System.DateTime use System.DateTime"
		alias
			"op_Addition"
		end

	frozen infix "|=" (d2: SYSTEM_DATE_TIME): BOOLEAN is
		external
			"IL operator signature (System.DateTime): System.Boolean use System.DateTime"
		alias
			"op_Inequality"
		end

	frozen infix ">=" (t2: SYSTEM_DATE_TIME): BOOLEAN is
		external
			"IL operator signature (System.DateTime): System.Boolean use System.DateTime"
		alias
			"op_GreaterThanOrEqual"
		end

	frozen infix "#==" (d2: SYSTEM_DATE_TIME): BOOLEAN is
		external
			"IL operator signature (System.DateTime): System.Boolean use System.DateTime"
		alias
			"op_Equality"
		end

	frozen op_subtraction_date_time_time_span (t: TIME_SPAN): SYSTEM_DATE_TIME is
		external
			"IL operator signature (System.TimeSpan): System.DateTime use System.DateTime"
		alias
			"op_Subtraction"
		end

	frozen infix "<=" (t2: SYSTEM_DATE_TIME): BOOLEAN is
		external
			"IL operator signature (System.DateTime): System.Boolean use System.DateTime"
		alias
			"op_LessThanOrEqual"
		end

	frozen infix "<" (t2: SYSTEM_DATE_TIME): BOOLEAN is
		external
			"IL operator signature (System.DateTime): System.Boolean use System.DateTime"
		alias
			"op_LessThan"
		end

	frozen infix ">" (t2: SYSTEM_DATE_TIME): BOOLEAN is
		external
			"IL operator signature (System.DateTime): System.Boolean use System.DateTime"
		alias
			"op_GreaterThan"
		end

	frozen infix "-" (d2: SYSTEM_DATE_TIME): TIME_SPAN is
		external
			"IL operator signature (System.DateTime): System.TimeSpan use System.DateTime"
		alias
			"op_Subtraction"
		end

end -- class SYSTEM_DATE_TIME

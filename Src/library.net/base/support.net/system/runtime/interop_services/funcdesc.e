indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Runtime.InteropServices.FUNCDESC"
	assembly: "mscorlib", "1.0.3300.0", "neutral", "b77a5c561934e089"

frozen expanded external class
	FUNCDESC

inherit
	VALUE_TYPE

feature -- Access

	frozen funckind: FUNCKIND is
		external
			"IL field signature :System.Runtime.InteropServices.FUNCKIND use System.Runtime.InteropServices.FUNCDESC"
		alias
			"funckind"
		end

	frozen o_vft: INTEGER_16 is
		external
			"IL field signature :System.Int16 use System.Runtime.InteropServices.FUNCDESC"
		alias
			"oVft"
		end

	frozen c_params_opt: INTEGER_16 is
		external
			"IL field signature :System.Int16 use System.Runtime.InteropServices.FUNCDESC"
		alias
			"cParamsOpt"
		end

	frozen c_scodes: INTEGER_16 is
		external
			"IL field signature :System.Int16 use System.Runtime.InteropServices.FUNCDESC"
		alias
			"cScodes"
		end

	frozen c_params: INTEGER_16 is
		external
			"IL field signature :System.Int16 use System.Runtime.InteropServices.FUNCDESC"
		alias
			"cParams"
		end

	frozen w_func_flags: INTEGER_16 is
		external
			"IL field signature :System.Int16 use System.Runtime.InteropServices.FUNCDESC"
		alias
			"wFuncFlags"
		end

	frozen lprgscode: POINTER is
		external
			"IL field signature :System.IntPtr use System.Runtime.InteropServices.FUNCDESC"
		alias
			"lprgscode"
		end

	frozen memid: INTEGER is
		external
			"IL field signature :System.Int32 use System.Runtime.InteropServices.FUNCDESC"
		alias
			"memid"
		end

	frozen invkind: INVOKEKIND is
		external
			"IL field signature :System.Runtime.InteropServices.INVOKEKIND use System.Runtime.InteropServices.FUNCDESC"
		alias
			"invkind"
		end

	frozen callconv: CALLCONV is
		external
			"IL field signature :System.Runtime.InteropServices.CALLCONV use System.Runtime.InteropServices.FUNCDESC"
		alias
			"callconv"
		end

	frozen lprgelemdesc_param: POINTER is
		external
			"IL field signature :System.IntPtr use System.Runtime.InteropServices.FUNCDESC"
		alias
			"lprgelemdescParam"
		end

	frozen elemdesc_func: ELEMDESC is
		external
			"IL field signature :System.Runtime.InteropServices.ELEMDESC use System.Runtime.InteropServices.FUNCDESC"
		alias
			"elemdescFunc"
		end

end -- class FUNCDESC

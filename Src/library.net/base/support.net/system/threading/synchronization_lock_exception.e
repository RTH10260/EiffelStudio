indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Threading.SynchronizationLockException"
	assembly: "mscorlib", "1.0.3300.0", "neutral", "b77a5c561934e089"

external class
	SYNCHRONIZATION_LOCK_EXCEPTION

inherit
	SYSTEM_EXCEPTION
	ISERIALIZABLE

create
	make_synchronization_lock_exception_2,
	make_synchronization_lock_exception_1,
	make_synchronization_lock_exception

feature {NONE} -- Initialization

	frozen make_synchronization_lock_exception_2 (message: SYSTEM_STRING; inner_exception: EXCEPTION) is
		external
			"IL creator signature (System.String, System.Exception) use System.Threading.SynchronizationLockException"
		end

	frozen make_synchronization_lock_exception_1 (message: SYSTEM_STRING) is
		external
			"IL creator signature (System.String) use System.Threading.SynchronizationLockException"
		end

	frozen make_synchronization_lock_exception is
		external
			"IL creator use System.Threading.SynchronizationLockException"
		end

end -- class SYNCHRONIZATION_LOCK_EXCEPTION

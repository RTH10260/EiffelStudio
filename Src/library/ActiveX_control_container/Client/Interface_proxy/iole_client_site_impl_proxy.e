indexing
	description: "Implemented `IOleClientSite' Interface."
	Note: "Automatically generated by the EiffelCOM Wizard."

class
	IOLE_CLIENT_SITE_IMPL_PROXY

inherit
	IOLE_CLIENT_SITE_INTERFACE

	ECOM_QUERIABLE

creation
	make_from_other,
	make_from_pointer

feature {NONE}  -- Initialization

	make_from_pointer (cpp_obj: POINTER) is
			-- Make from pointer
		do
			initializer := ccom_create_iole_client_site_impl_proxy_from_pointer(cpp_obj)
			item := ccom_item (initializer)
		end

feature -- Basic Operations

	save_object is
			-- No description available.
		do
			ccom_save_object (initializer)
		end

	get_moniker (dw_assign: INTEGER; dw_which_moniker: INTEGER; ppmk: CELL [IMONIKER_INTERFACE]) is
			-- No description available.
			-- `dw_assign' [in].  
			-- `dw_which_moniker' [in].  
			-- `ppmk' [out].  
		do
			ccom_get_moniker (initializer, dw_assign, dw_which_moniker, ppmk)
		end

	get_container (pp_container: CELL [IOLE_CONTAINER_INTERFACE]) is
			-- No description available.
			-- `pp_container' [out].  
		do
			ccom_get_container (initializer, pp_container)
		end

	show_object is
			-- No description available.
		do
			ccom_show_object (initializer)
		end

	on_show_window (f_show: INTEGER) is
			-- No description available.
			-- `f_show' [in].  
		do
			ccom_on_show_window (initializer, f_show)
		end

	request_new_object_layout is
			-- No description available.
		do
			ccom_request_new_object_layout (initializer)
		end

feature {NONE}  -- Implementation

	delete_wrapper is
			-- Delete wrapper
		do
			ccom_delete_iole_client_site_impl_proxy(initializer)
		end

feature {NONE}  -- Externals

	ccom_save_object (cpp_obj: POINTER) is
			-- No description available.
		external
			"C++ [ecom_control_library::IOleClientSite_impl_proxy %"ecom_control_library_IOleClientSite_impl_proxy_s.h%"]()"
		end

	ccom_get_moniker (cpp_obj: POINTER; dw_assign: INTEGER; dw_which_moniker: INTEGER; ppmk: CELL [IMONIKER_INTERFACE]) is
			-- No description available.
		external
			"C++ [ecom_control_library::IOleClientSite_impl_proxy %"ecom_control_library_IOleClientSite_impl_proxy_s.h%"](EIF_INTEGER,EIF_INTEGER,EIF_OBJECT)"
		end

	ccom_get_container (cpp_obj: POINTER; pp_container: CELL [IOLE_CONTAINER_INTERFACE]) is
			-- No description available.
		external
			"C++ [ecom_control_library::IOleClientSite_impl_proxy %"ecom_control_library_IOleClientSite_impl_proxy_s.h%"](EIF_OBJECT)"
		end

	ccom_show_object (cpp_obj: POINTER) is
			-- No description available.
		external
			"C++ [ecom_control_library::IOleClientSite_impl_proxy %"ecom_control_library_IOleClientSite_impl_proxy_s.h%"]()"
		end

	ccom_on_show_window (cpp_obj: POINTER; f_show: INTEGER) is
			-- No description available.
		external
			"C++ [ecom_control_library::IOleClientSite_impl_proxy %"ecom_control_library_IOleClientSite_impl_proxy_s.h%"](EIF_INTEGER)"
		end

	ccom_request_new_object_layout (cpp_obj: POINTER) is
			-- No description available.
		external
			"C++ [ecom_control_library::IOleClientSite_impl_proxy %"ecom_control_library_IOleClientSite_impl_proxy_s.h%"]()"
		end

	ccom_delete_iole_client_site_impl_proxy (a_pointer: POINTER) is
			-- Release resource
		external
			"C++ [delete ecom_control_library::IOleClientSite_impl_proxy %"ecom_control_library_IOleClientSite_impl_proxy_s.h%"]()"
		end

	ccom_create_iole_client_site_impl_proxy_from_pointer (a_pointer: POINTER): POINTER is
			-- Create from pointer
		external
			"C++ [new ecom_control_library::IOleClientSite_impl_proxy %"ecom_control_library_IOleClientSite_impl_proxy_s.h%"](IUnknown *)"
		end

	ccom_item (cpp_obj: POINTER): POINTER is
			-- Item
		external
			"C++ [ecom_control_library::IOleClientSite_impl_proxy %"ecom_control_library_IOleClientSite_impl_proxy_s.h%"]():EIF_POINTER"
		end

end -- IOLE_CLIENT_SITE_IMPL_PROXY


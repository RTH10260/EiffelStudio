indexing
	generator: "Eiffel Emitter 3.1rc1"
	external_name: "System.Windows.Forms.ListBox+SelectedIndexCollection"
	assembly: "System.Windows.Forms", "1.0.3300.0", "neutral", "b77a5c561934e089"

external class
	WINFORMS_SELECTED_INDEX_COLLECTION_IN_WINFORMS_LIST_BOX

inherit
	SYSTEM_OBJECT
		redefine
			finalize,
			get_hash_code,
			equals,
			to_string
		end
	ILIST
		rename
			set_item as system_collections_ilist_set_item,
			get_item as system_collections_ilist_get_item,
			remove_at as system_collections_ilist_remove_at,
			remove as system_collections_ilist_remove,
			insert as system_collections_ilist_insert,
			clear as system_collections_ilist_clear,
			add as system_collections_ilist_add,
			index_of as system_collections_ilist_index_of,
			contains as system_collections_ilist_contains,
			get_is_fixed_size as system_collections_ilist_get_is_fixed_size,
			get_is_synchronized as system_collections_icollection_get_is_synchronized,
			get_sync_root as system_collections_icollection_get_sync_root
		end
	ICOLLECTION
		rename
			get_is_synchronized as system_collections_icollection_get_is_synchronized,
			get_sync_root as system_collections_icollection_get_sync_root
		end
	IENUMERABLE

create
	make

feature {NONE} -- Initialization

	frozen make (owner: WINFORMS_LIST_BOX) is
		external
			"IL creator signature (System.Windows.Forms.ListBox) use System.Windows.Forms.ListBox+SelectedIndexCollection"
		end

feature -- Access

	frozen get_item (index: INTEGER): INTEGER is
		external
			"IL signature (System.Int32): System.Int32 use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"get_Item"
		end

	frozen get_count: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"get_Count"
		end

	frozen get_is_read_only: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"get_IsReadOnly"
		end

feature -- Basic Operations

	get_hash_code: INTEGER is
		external
			"IL signature (): System.Int32 use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"GetHashCode"
		end

	frozen get_enumerator: IENUMERATOR is
		external
			"IL signature (): System.Collections.IEnumerator use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"GetEnumerator"
		end

	frozen contains (selected_index: INTEGER): BOOLEAN is
		external
			"IL signature (System.Int32): System.Boolean use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"Contains"
		end

	frozen index_of (selected_index: INTEGER): INTEGER is
		external
			"IL signature (System.Int32): System.Int32 use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"IndexOf"
		end

	to_string: SYSTEM_STRING is
		external
			"IL signature (): System.String use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"ToString"
		end

	frozen copy_to (dest: SYSTEM_ARRAY; index: INTEGER) is
		external
			"IL signature (System.Array, System.Int32): System.Void use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"CopyTo"
		end

	equals (obj: SYSTEM_OBJECT): BOOLEAN is
		external
			"IL signature (System.Object): System.Boolean use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"Equals"
		end

feature {NONE} -- Implementation

	frozen system_collections_ilist_set_item (index: INTEGER; value: SYSTEM_OBJECT) is
		external
			"IL signature (System.Int32, System.Object): System.Void use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.IList.set_Item"
		end

	frozen system_collections_icollection_get_sync_root: SYSTEM_OBJECT is
		external
			"IL signature (): System.Object use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.ICollection.get_SyncRoot"
		end

	frozen system_collections_ilist_index_of (selected_index: SYSTEM_OBJECT): INTEGER is
		external
			"IL signature (System.Object): System.Int32 use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.IList.IndexOf"
		end

	frozen system_collections_ilist_remove (value: SYSTEM_OBJECT) is
		external
			"IL signature (System.Object): System.Void use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.IList.Remove"
		end

	frozen system_collections_ilist_add (value: SYSTEM_OBJECT): INTEGER is
		external
			"IL signature (System.Object): System.Int32 use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.IList.Add"
		end

	frozen system_collections_ilist_get_item (index: INTEGER): SYSTEM_OBJECT is
		external
			"IL signature (System.Int32): System.Object use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.IList.get_Item"
		end

	frozen system_collections_icollection_get_is_synchronized: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.ICollection.get_IsSynchronized"
		end

	frozen system_collections_ilist_contains (selected_index: SYSTEM_OBJECT): BOOLEAN is
		external
			"IL signature (System.Object): System.Boolean use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.IList.Contains"
		end

	frozen system_collections_ilist_clear is
		external
			"IL signature (): System.Void use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.IList.Clear"
		end

	frozen system_collections_ilist_get_is_fixed_size: BOOLEAN is
		external
			"IL signature (): System.Boolean use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.IList.get_IsFixedSize"
		end

	frozen system_collections_ilist_remove_at (index: INTEGER) is
		external
			"IL signature (System.Int32): System.Void use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.IList.RemoveAt"
		end

	finalize is
		external
			"IL signature (): System.Void use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"Finalize"
		end

	frozen system_collections_ilist_insert (index: INTEGER; value: SYSTEM_OBJECT) is
		external
			"IL signature (System.Int32, System.Object): System.Void use System.Windows.Forms.ListBox+SelectedIndexCollection"
		alias
			"System.Collections.IList.Insert"
		end

end -- class WINFORMS_SELECTED_INDEX_COLLECTION_IN_WINFORMS_LIST_BOX

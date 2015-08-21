note
	description: "[
		API to handle Wish List storage
		]"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CMS_WISH_LIST_STORAGE_I

inherit
	SHARED_LOGGER

feature -- Error Handling

	error_handler: ERROR_HANDLER
			-- Error handler.
		deferred
		end


feature -- Access : WishList	

	row_count_wish_list (a_category: INTEGER; a_status: STRING; a_filter: STRING; a_content:INTEGER ): INTEGER
			-- Row count for wish list
		deferred
		end

	wish_list (a_page_number: INTEGER; a_rows_per_page: INTEGER; a_category: INTEGER; a_status: STRING; a_column: READABLE_STRING_32; a_order: INTEGER; a_filter:STRING; a_content:INTEGER): LIST [CMS_WISH_LIST]
			-- All Wishlist items, filter by page `a_page_numer' and rows per page `a_row_per_page'
		deferred
		end

	wish_by_id (a_wid: INTEGER): detachable CMS_WISH_LIST
			-- Wish list item for the given id `a_wid', if any.
		deferred
		end

	wish_interactions (a_wid: INTEGER): detachable LIST [CMS_WISH_LIST_INTERACTION]
			-- Wish list interactions for a given wish `a_wid', if any.
		deferred
		end

	wish_attachments (a_wid: INTEGER_64; a_interaction_id: INTEGER_64): detachable LIST [CMS_WISH_FILE]
			--  Wish list attachments for a given wish `a_wid', if any.
		deferred
		end


	wish_author (a_wish: CMS_WISH_LIST): detachable CMS_USER
			-- Wish's author. if any.
		require
			valid_wish: a_wish.has_id
		deferred
		end

feature -- Change: Wishlist

	save_wish (a_wish: CMS_WISH_LIST)
			-- Save a new wish `a_wish'.
		deferred
		end

	save_wish_interaction (a_wish: CMS_WISH_LIST_INTERACTION)
			-- Save a new wish `a_wish_interaction'.
		deferred
		end

	upload_wish_attachment  (a_id: INTEGER_64; a_interaction_id: INTEGER_64; a_size:INTEGER_64; a_content: READABLE_STRING_32; a_file_name: READABLE_STRING_32)
			-- Upload a file for a wish list item `a_id' with file name `a_file_name', content `a_content' and length `a_size'.
		deferred
		end

	remove_wish_attachments (a_id: INTEGER_64; a_interaction_id: INTEGER_64)
			-- Remove all attachments associated with `a_id'.
		deferred
		end

	remove_wish_attachment_by_name (a_id: INTEGER_64; a_interaction_id: INTEGER_64; a_name: READABLE_STRING_32)
			-- Remove attachment with name `a_name' associated with wish `a_id'.
		deferred
		end

feature -- Access: Categories

	categories: LIST [CMS_WISH_LIST_CATEGORY]
			-- List of wish list categories.
		deferred
		end


feature -- Access: Status

	status: LIST [CMS_WISH_LIST_STATUS]
			-- List of wish list status.
		deferred
		end


feature -- Access: Wish List


end

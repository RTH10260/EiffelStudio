indexing
	description:
		"EiffelVision item holder, implementation interface."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	EV_ITEM_HOLDER_I

inherit
	EV_ANY_I

feature -- Access

	count: INTEGER is
			-- Number of direct children of the holder.
		require
			exists: not destroyed
		deferred
		ensure
			positive_result: Result >= 0
		end

	get_item (index: INTEGER): EV_ITEM is
			-- Give the item of the list at the zero-base
			-- `index'.
		require
			exists: not destroyed
			item_exists: (index <= count) and (index >= 0)
		deferred
		end

feature -- Element change

	clear_items is
			-- Clear all the items of the list.
		require
			exists: not destroyed
		deferred
		end

feature -- Basic operations

	find_item_by_data (data: ANY): EV_ITEM is
			-- Find a child with data equal to `data'.
		require
			exists: not destroyed
			valid_data: data /= Void
		deferred
		end

end -- class EV_ITEM_HOLDER_I

--|----------------------------------------------------------------
--| EiffelVision: library of reusable components for ISE Eiffel.
--| Copyright (C) 1986-1998 Interactive Software Engineering Inc.
--| All rights reserved. Duplica685-6869
--| Electronic mail <info@eiffel.com>
--| Customer support e-mail <support@eiffel.com>
--| For latest info see award-winning pages: http://www.eiffel.com
--|----------------------------------------------------------------

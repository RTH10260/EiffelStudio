indexing
	description: "Windows implementation of EV_POINTER_STYLE_I."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	keywords: "mouse, pointer, cursor, arrow"
	date: "$Date$"
	revision: "$Revision$"

class
	EV_POINTER_STYLE_IMP

inherit
	EV_POINTER_STYLE_I
		export
			{EV_ANY_HANDLER}
				interface
		redefine
			destroy
		end

	EV_ANY_HANDLER

create
	make

feature {NONE} -- Initlization

	make (an_interface: EV_POINTER_STYLE) is
			-- Creation method
		do
			base_make (an_interface)
		end

	initialize is
			-- Initialize
		do
			set_is_initialized (True)
		end

	init_from_pixel_buffer (a_pixel_buffer: EV_PIXEL_BUFFER) is
			-- Initialize from `a_pixel_buffer'
		local
			l_pix_buf_imp: EV_PIXEL_BUFFER_IMP
		do
			l_pix_buf_imp ?= a_pixel_buffer.implementation
			set_gdkpixbuf ({EV_GTK_EXTERNALS}.gdk_pixbuf_copy (l_pix_buf_imp.gdk_pixbuf))
		end

	init_predefined (a_constant: INTEGER) is
			-- Initialized a predefined cursor.
		do
			predefined_cursor_code := a_constant
		end

	init_from_cursor (a_cursor: EV_CURSOR) is
			-- Initialize from `a_cursor'
		local
			a_pix_imp: EV_PIXMAP_IMP
		do
			a_pix_imp ?= a_cursor.implementation
			set_gdkpixbuf (a_pix_imp.pixbuf_from_drawable)
		end

feature -- Command

	destroy is
			-- Destroy
		do
			set_gdkpixbuf (default_pointer)
		end

feature -- Query

	width: INTEGER is
			-- Width of pointer style.
		do
			if gdk_pixbuf /= default_pointer then
				Result := {EV_GTK_EXTERNALS}.gdk_pixbuf_get_width (gdk_pixbuf)
			else
				Result := {EV_GTK_EXTERNALS}.gdk_display_get_default_cursor_size ({EV_GTK_EXTERNALS}.gdk_display_get_default)
			end
		end

	height: INTEGER is
			-- Height of pointer style.
		do
			if gdk_pixbuf /= default_pointer then
				Result := {EV_GTK_EXTERNALS}.gdk_pixbuf_get_height (gdk_pixbuf)
			else
				Result := {EV_GTK_EXTERNALS}.gdk_display_get_default_cursor_size ({EV_GTK_EXTERNALS}.gdk_display_get_default)
			end
		end

feature -- Implementation

	gdk_cursor_from_pointer_style: POINTER is
			-- Return a GdkCursor constructed from `a_cursor'
		local
			a_pixbuf: POINTER
		do
			inspect
				predefined_cursor_code
					-- Return a predefined cursor if available.
			when {EV_POINTER_STYLE_CONSTANTS}.busy_cursor then
				Result := {EV_GTK_EXTERNALS}.gdk_cursor_new ({EV_GTK_ENUMS}.gdk_watch_enum)
			when {EV_POINTER_STYLE_CONSTANTS}.standard_cursor then
				Result := {EV_GTK_EXTERNALS}.gdk_cursor_new ({EV_GTK_ENUMS}.gdk_left_ptr_enum)
			when {EV_POINTER_STYLE_CONSTANTS}.crosshair_cursor then
				Result := {EV_GTK_EXTERNALS}.gdk_cursor_new ({EV_GTK_ENUMS}.gdk_crosshair_enum)
			when {EV_POINTER_STYLE_CONSTANTS}.ibeam_cursor then
				Result := {EV_GTK_EXTERNALS}.gdk_cursor_new ({EV_GTK_ENUMS}.gdk_xterm_enum)
			when {EV_POINTER_STYLE_CONSTANTS}.sizeall_cursor then
				Result := {EV_GTK_EXTERNALS}.gdk_cursor_new ({EV_GTK_ENUMS}.gdk_fleur_enum)
			when {EV_POINTER_STYLE_CONSTANTS}.sizens_cursor then
				Result := {EV_GTK_EXTERNALS}.gdk_cursor_new ({EV_GTK_ENUMS}.Gdk_size_sb_v_double_arrow_enum)
			when {EV_POINTER_STYLE_CONSTANTS}.wait_cursor then
				Result := {EV_GTK_EXTERNALS}.gdk_cursor_new ({EV_GTK_ENUMS}.gdk_watch_enum)


			when {EV_POINTER_STYLE_CONSTANTS}.no_cursor then
				a_pixbuf := {EV_GTK_EXTERNALS}.gdk_pixbuf_new_from_xpm_data ({EV_STOCK_PIXMAPS_IMP}.no_cursor_xpm)
			when {EV_POINTER_STYLE_CONSTANTS}.sizenwse_cursor then
				a_pixbuf := {EV_GTK_EXTERNALS}.gdk_pixbuf_new_from_xpm_data ({EV_STOCK_PIXMAPS_IMP}.sizenwse_cursor_xpm)
			when {EV_POINTER_STYLE_CONSTANTS}.sizenesw_cursor then
				a_pixbuf := {EV_GTK_EXTERNALS}.gdk_pixbuf_new_from_xpm_data ({EV_STOCK_PIXMAPS_IMP}.sizenesw_cursor_xpm)
			when {EV_POINTER_STYLE_CONSTANTS}.sizewe_cursor then
				a_pixbuf := {EV_GTK_EXTERNALS}.gdk_pixbuf_new_from_xpm_data ({EV_STOCK_PIXMAPS_IMP}.sizewe_cursor_xpm)
			when {EV_POINTER_STYLE_CONSTANTS}.uparrow_cursor then
				a_pixbuf := {EV_GTK_EXTERNALS}.gdk_pixbuf_new_from_xpm_data ({EV_STOCK_PIXMAPS_IMP}.uparrow_cursor_xpm)
			else
				a_pixbuf := gdk_pixbuf
				{EV_GTK_EXTERNALS}.object_ref (a_pixbuf)
			end

			if Result = default_pointer then
				check
					a_pixbuf_not_null: a_pixbuf /= default_pointer
				end
				Result := {EV_GTK_DEPENDENT_EXTERNALS}.gdk_cursor_new_from_pixbuf (
					{EV_GTK_DEPENDENT_EXTERNALS}.gdk_display_get_default,
					gdk_pixbuf,
					interface.x_hotspot,
					interface.y_hotspot
				)
				{EV_GTK_EXTERNALS}.object_unref (a_pixbuf)
			end
		end

	set_gdkpixbuf (a_pixbuf: POINTER) is
			-- Set gdk_pixbuf to `a_pixbuf'.
		do
			if gdk_pixbuf /= default_pointer then
				{EV_GTK_EXTERNALS}.object_unref (gdk_pixbuf)
			end
			gdk_pixbuf := a_pixbuf
		end

	gdk_pixbuf: POINTER
		-- Pixbuf used for pointer style implementation.

feature {EV_ANY_HANDLER} -- Implementation

	predefined_cursor_code: INTEGER;
		-- Predefined cursor code used for selecting platform cursors.

indexing
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"



end

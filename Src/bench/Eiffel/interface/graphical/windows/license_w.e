-- Generated by EiffelBuild, promise (Fred)

class LICENSE_W

inherit

	COMMAND_W;
	LICENSE_WINDOW
		rename
			make as license_window_make,
			dot as cursor_dot
		undefine
			execute, watch_cursor
		end;

creation

	make

feature -- Widgets

	make is
		do
			license_window_make ("License window", Project_tool);
		end;

end

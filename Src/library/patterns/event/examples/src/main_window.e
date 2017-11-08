note
	description: "Main window for this application"
	author: "Generated by the New Vision2 Application Wizard."
	date: "$Date$"
	revision: "1.0.0"

class
	MAIN_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			initialize,
			is_in_default_state
		end

	INTERFACE_NAMES
		export
			{NONE} all
		undefine
			default_create, copy
		end

create
	default_create

feature {NONE} -- Initialization


	initialize
			-- Build the interface for this window.
		do
			Precursor {EV_TITLED_WINDOW}

				-- Execute `request_close_window' when the user clicks
				-- on the cross in the title bar.
			close_request_actions.extend (agent request_close_window)

			build_widgets

				-- Set the title of the window.
			set_title (Window_title)

				-- Set the initial size of the window.
			set_size (Window_width, Window_height)
		end

	is_in_default_state: BOOLEAN
			-- Is the window in its default state?
			-- (as stated in `initialize')
		do
			Result := (width = Window_width) and then
				(height = Window_height) and then
				(title.is_equal (Window_title))
		end

feature {NONE} -- About Dialog Implementation

	on_about
			-- Display the About dialog.
		local
			about_dialog: ABOUT_DIALOG
		do
			create about_dialog
			about_dialog.show_modal_to_window (Current)
		end

feature {NONE} -- Widget implementation

	build_widgets
			-- Create the GUI elements.
		require
			enclosing_box_not_yet_created: enclosing_box = void
			start_button_not_yet_created: start_button = void
		do
			-- Avoid flicker on some platforms
			lock_update

				-- Cover entire window area with a primitive container.
			create enclosing_box
			if attached enclosing_box as eb then
				extend (eb)
			end

				-- Add 'start' button primitive
			create start_button.make_with_text ("Start the application")
			if attached start_button as sb then
				sb.select_actions.extend (agent start_actions)
			end

			if
				attached enclosing_box as eb and then
				attached start_button as sb
			then
				eb.extend (sb)
				eb.set_item_x_position (sb, 120)
				eb.set_item_y_position (sb, 115)
			end


			create application_window_1
			create application_window_2
			create application_window_3

			if attached application_window_1 as l_app1 then
				l_app1.set_title ("Event application: client window 1")
			end
			if attached application_window_2 as l_app2 then
				l_app2.set_title ("Event application: client window 2")
			end
			if attached application_window_3 as l_app3 then
				l_app3.set_title ("Event application: client window 3")
			end


			if attached application_window_1 as l_app1 then
				l_app1.show
			end
			if attached application_window_2 as l_app2 then
				l_app2.show
			end
			if attached application_window_3 as l_app3 then
				l_app3.show
			end
			-- Allow screen refresh on some platforms
			unlock_update
		ensure
			enclosing_box_created: enclosing_box /= void
			start_button_created: start_button /= void
			application_window_1_not_void: application_window_1 /= Void
			application_window_2_not_void: application_window_2 /= Void
			application_window_3_not_void: application_window_3 /= Void
		end

	start_actions
			-- Start the appropriate actions.
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			if attached start_button as sb then
				sb.disable_capture
			end

			Sensor.temperature_event.suspend_subscriptions
			Sensor.humidity_event.suspend_subscriptions
			Sensor.pressure_event.suspend_subscriptions

			Sensor.temperature_event.restore_subscriptions
			Sensor.humidity_event.restore_subscriptions
			Sensor.pressure_event.restore_subscriptions

			create info_dialog.make_with_text ("Client window 1 subscribed to temperature and humidity%NClient window 2 subscribed to humidity and pressure%NClient window 3 subscribed to temperature, humidity and pressure%N%NTo proceed please press OK button!]")
			info_dialog.show_modal_to_window (Current)

				-- subscribe to temperature and humidity in application_window_1
			if attached application_window_1 as l_app1 then
				Sensor.temperature_event.subscribe (agent l_app1.display_temperature (?))
				Sensor.humidity_event.subscribe (agent l_app1.display_humidity (?))
			end


				-- subscribe to humidity and pressure in application_window_2
			if attached application_window_2 as l_app2 then
				Sensor.humidity_event.subscribe (agent l_app2.display_humidity (?))
				Sensor.pressure_event.subscribe (agent l_app2.display_pressure (?))
			end

				-- subscribe to temperature, humidity and pressure in application_window_3
			if attached application_window_3 as l_app3 then
				Sensor.temperature_event.subscribe (agent l_app3.display_temperature (?))
				Sensor.humidity_event.subscribe (agent l_app3.display_humidity (?))
				Sensor.pressure_event.subscribe (agent l_app3.display_pressure (?))
			end
			change_values

			create info_dialog.make_with_text ("Now client window 1 unsubscribes temperature%N%NTo proceed please press OK button!")
			info_dialog.show_modal_to_window (Current)

			reset_widgets
			if attached application_window_1 as l_app1 then
				Sensor.temperature_event.unsubscribe (agent l_app1.display_temperature)
			end
			change_values


			create info_dialog.make_with_text ("Now all subscription are suspended%N To proceed please press OK button!")
			info_dialog.show_modal_to_window (Current)

			reset_widgets
			Sensor.temperature_event.suspend_subscriptions
			Sensor.humidity_event.suspend_subscriptions
			Sensor.pressure_event.suspend_subscriptions
			change_values
		end

	change_values
			-- Change values of `Sensor' object.
		local
			i: INTEGER
			j: INTEGER
			k: INTEGER
		do
			from
				i := 50
				j := 70
				k := 2500
			until
				i > 60
			loop
				if i \\ 2 = 0 then
					sensor.set_temperature (i)
				end
				if j \\ 2 = 1 then
					sensor.set_humidity (j)
				end
				sensor.set_pressure (k)
				i := i + 1
				j := j + 1
				k := k + 1
				if attached Application as l_app then
					l_app.process_events
				end
				wait
			end
		end

	wait
			-- Wait for `Iterations' before proceeding
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i = Iterations
			loop
				i := i + 1
			end

		end

	reset_widgets
			-- Reset contents of all widgets.
		do
			if attached application_window_1 as l_app1 then
				l_app1.reset_widget
			end
			if attached application_window_2 as l_app2 then
				l_app2.reset_widget
			end
			if attached application_window_3 as l_app3 then
				l_app3.reset_widget
			end
		end

	destroy_application
			-- Destroy the application.
		do
			if attached Application as l_app then
				l_app.destroy
			end

		end


feature {NONE} -- Implementation, Close event

	request_close_window
			-- Process user request to close the window.
		local
			question_dialog: EV_CONFIRMATION_DIALOG
		do
			create question_dialog.make_with_text (Label_confirm_close_window)
			question_dialog.show_modal_to_window (Current)

			if question_dialog.selected_button ~ (create {EV_DIALOG_CONSTANTS}).ev_ok then
					-- Destroy the window.
				destroy

					-- End the application.
					--| TODO: Remove next instruction if you don't want the application
					--|       to end when the first window is closed..
				if attached (create {EV_ENVIRONMENT}).application as a then
					a.destroy
				end
			end
		end

feature {NONE} -- Implementation

	enclosing_box: detachable EV_FIXED
			-- Invisible Primitives Container

	start_button: detachable EV_BUTTON
			-- Start button

	application_window_1: detachable APPLICATION_WINDOW
			-- application window 1

	application_window_2: detachable APPLICATION_WINDOW
			-- application window 2	

	application_window_3: detachable APPLICATION_WINDOW
			-- application window 3		

feature {NONE} -- Implementation / Constants

	Application: detachable EV_APPLICATION
			-- Application
		once
			Result :=(create {EV_ENVIRONMENT}).application
		ensure
			application_created: Result /= Void
		end

	Sensor: SENSOR
			-- Publisher
		once
 			create Result.make
 		ensure
 			sensor_created: Result /= Void
		end

	Iterations: INTEGER = 2000000
			-- Iterations


	Window_title: STRING = "Event application: main window"
			-- Title of the window.

	Window_width: INTEGER = 400
			-- Initial width for this window.

	Window_height: INTEGER = 400
			-- Initial height for this window.

end

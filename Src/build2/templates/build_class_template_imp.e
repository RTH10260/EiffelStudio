indexing
	description: "Objects that represent an EV_TITLED_WINDOW generated by Build."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	<CLASS_NAME>

inherit
	EV_TITLED_WINDOW
		redefine
			initialize, is_in_default_state
		end

feature {NONE} -- Initialization

	initialize is
			-- Initialize `Current'.
		local
			<LOCAL>
		do
			Precursor {EV_TITLED_WINDOW}

				-- Create all widgets.
			<CREATE>

				-- Build widget structure.
			<BUILD>

				-- Initialize properties of all widgets.<SET>


				-- Connect events.
			<EVENT_CONNECTION>

				-- Close the application when an interface close
				-- request is recieved on `Current'. i.e. the cross is clicked.
			close_request_actions.extend (agent ((create {EV_ENVIRONMENT}).application).destroy)
		end


feature {NONE} -- Implementation

	is_in_default_state: BOOLEAN is
			-- Is `Current' in its default state?
		do
			-- Re-implement if you wish to enable checking
			-- for `Current'.
			Result := True
		end

	<EVENT_DECLARATION>	

end -- class <CLASS_NAME>

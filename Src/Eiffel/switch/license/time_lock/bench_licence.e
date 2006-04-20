indexing

	description: "License manager for $EiffelGraphicalCompiler$ under Windows."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class BENCH_LICENSE

inherit
	LICENSE
		rename
			product_key as key,
			non_commercial_product_key as non_commercial_key
		redefine
			verify_current_user
		end

	SHARED_CODES
		rename
			studio_non_commercial_key_50 as non_commercial_key,
			studio_enterprise_key_52 as key
		export
			{NONE} all
		end

create
	make

feature -- Initialization

	make is
			-- Initialization.
		do
			has_been_launched := False
		end

feature -- Validity

	alive: BOOLEAN is True
			-- The license is always alive

	licensed: BOOLEAN
			-- Is the product licensed?

feature -- Registration

	get_license is 
			-- Get the license for $EiffelGraphicalCompiler$.
		local
			shareware_prompt: SHAREWARE_PROMPT
			environment: EXECUTION_ENVIRONMENT
			duration: INTEGER
			encoder: DES_ASCII_ENCODER
		do
			create environment
			username := clone (environment.get ("BENCH_USERNAME"))
			password := clone (environment.get ("BENCH_PASSWORD"))

			verify_current_user

				-- We display the register dialog only when the user did not register yet,
				-- or when the user has an expired copy or when opening
				-- $EiffelGraphicalCompiler$ without having a valid license
			if (not licensed or else demo_mode) then
				if not Is_beta then
					if not has_been_launched then
							-- We launched $EiffelGraphicalCompiler$ once, we do not need anymore
							-- to display this message all the time.
						has_been_launched := True
						duration := Default_waiting_time.max (waiting_time)
					else
						duration := waiting_time
					end
				end

					-- Before asking anything to the user, we restore the default settings.
				licensed := False
				demo_mode := False

					-- Display dialog information
				if not Is_beta or else (time_left = -1) then
					create shareware_prompt.make (Current, Is_beta, duration, time_left, Max_days)
					shareware_prompt.activate
				else
					if Is_beta then
						licensed := True
						non_commercial_mode := False
						username := "Beta user"
					else
						if username /= Void and then password /= Void then
							create encoder.make_with_key (non_commercial_key)
							if not encoder.encrypt (username).is_equal (password) then
								username := "Non-registered user"
							end
							encoder.terminate
						else
							username := "Non-registered user"
						end
					end
					password := username
				end
				if licensed then
						-- The user seems to have enter the correct information
						-- We now need to store it in the registry keys
					environment.put (username, "BENCH_USERNAME")
					environment.put (password, "BENCH_PASSWORD")
				elseif demo_mode then
					licensed := True
				end
			end
		end

	release is 
			-- Release the license.
		do 
			licensed := False
		end

feature -- Info

	expiration_date: INTEGER is
			-- Expiration date of the application (used here for the demo version).
		local
			date_name: STRING
			encoder: DES_ENCODER
			environment: EXECUTION_ENVIRONMENT
		do
			create environment

				-- Create the DES encoder/decoder
			create encoder.make_with_key (non_commercial_key)

				-- Get the stored expiration date
			date_name := clone (environment.get ("STUDIO_TRIAL_52"))

			if date_name /= Void and then date_name.count > 0 then
				check
					encoder.decrypt (date_name).is_integer
				end
				Result := encoder.decrypt (date_name).to_integer
			else
					-- This is the first time that we launched $EiffelGraphicalCompiler$,
					-- so we need to store the expiration date, which is the current date
					-- plus a month. Here we have a protection against null character in
					-- registry keys.
				from
					Result := time + Max_days_in_seconds
					date_name := encoder.encrypt (Result.out)
				until
					date_name.index_of ('%U', 1) = 0
				loop
					Result := time + Max_days_in_seconds
					date_name := encoder.encrypt (Result.out)
				end
				environment.put (date_name, "BENCH_TRIAL_52")
			end
			encoder.terminate
		end

	time_left: INTEGER is
			-- Number of days left before license expires
		local
			date_of_expiration: INTEGER
			local_time: INTEGER
		do
			date_of_expiration := expiration_date
			local_time := time
			if Is_beta then
				if local_time > Beta_limit then
					Result := -1
				end
			elseif local_time > date_of_expiration then
				Result := -1				
			else
					-- Get the number of days from a result given in seconds.
				Result := ((date_of_expiration - local_time) // 3600) // 24
			end
		end

feature -- Init

	verify_current_user is
			-- Check current user information.
		local
			encoder: DES_ASCII_ENCODER
		do
			if is_free_version then
				licensed := True
				non_commercial_mode := True
			else
				licensed := False
				non_commercial_mode := False
				if
					username /= Void and then
					username.count > 5 and then
					password /= Void
				 then
					create encoder.make_with_key (key)
					licensed := encoder.encrypt (username).is_equal (password)
					encoder.terminate
					if not licensed then
						create encoder.make_with_key (non_commercial_key)
						licensed := encoder.encrypt (username).is_equal (password)
						encoder.terminate
						non_commercial_mode := True
					end
				end
			end
		end

feature {NONE} -- Not applicable

	daemon_alive: BOOLEAN is True
	is_unlimited: BOOLEAN is True
	license_count: INTEGER is 0
	license_host: STRING is "WINDOWS"
	usage_info: STRING is ""
	valid_expiration_date: BOOLEAN is True

feature {NONE} -- Implementation

	has_been_launched: BOOLEAN
			-- Has the application been launched once?

	waiting_time: INTEGER is
			-- Number of seconds to wait before executing a command in the Trial edition.
		do
			Result := ((25 / Max_days) * number_of_days + Max_waiting_time).rounded
		end

	number_of_days: INTEGER is
			-- Number of days since the first installation
		do
			Result := ((time - installation_date) // 3600) // 24
		end

	installation_date: INTEGER is
			-- Give in seconds the installation date.
		do
			Result := expiration_date - Max_days_in_seconds
		end

feature {NONE} -- Constants

	Max_days_in_seconds: INTEGER is
			-- Max days + Max_waiting_time seconds translated in seconds.
		once
			Result := Max_days * 3600 * 24 + Max_waiting_time
		end

	Max_days: INTEGER is 60
			-- Numbers of days of evaluation
		
	Min_waiting_time: INTEGER is 1
	Max_waiting_time: INTEGER is 2
			-- Time to wait before being able to use environment.

	Default_waiting_time: INTEGER is 1
			-- Number of seconds to wait before using $EiffelGraphicalCompiler$ for the first time.

	Is_beta: BOOLEAN is True
			-- Is it a beta evaluation?
			
	Is_free_version: BOOLEAN is False
			-- Is this a free version?

	Beta_limit: INTEGER is 1030889106
			-- Hard coded time which corresponds to end of August 2002.

feature {NONE} -- Externals

	time: INTEGER is
		do
			Result := c_time ($Result)
		ensure
			valid_result: Result /= -1
		end

	c_time (t: POINTER): INTEGER is
		external
			"C signature (time_t *): EIF_INTEGER use <time.h>"
		alias
			"time"
		end

indexing
	copyright:	"Copyright (c) 1984-2006, Eiffel Software"
	license:	"GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options:	"http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful,	but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the	GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA
		]"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end -- class BENCH_LICENSE

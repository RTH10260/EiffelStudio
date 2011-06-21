note
	description: "Objects that represent an EV_TITLED_WINDOW.%
		%The original version of this class was generated by EiffelBuild."
	generator: "EiffelBuild"
	date: "$Date$"
	revision: "$Revision$"

class
	ER_MAIN_WINDOW

inherit
	ER_MAIN_WINDOW_IMP


feature {NONE} -- Initialization

	user_initialization
			-- Called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			set_size (1280, 600)

			show_actions.extend_kamikaze (agent init_after_shown)

			show_actions.extend_kamikaze (agent
								local
									l_env: EV_ENVIRONMENT
								do
									create l_env
									if attached l_env.application as l_app then
										l_app.destroy_actions.extend (agent save_tool_info_when_exit)
									end
								end)

			new_project_command.set_main_window (Current)
			open_project_command.set_main_window (Current)
			recent_project_command.set_main_window (Current)
			gen_code_command.set_main_window (Current)
			new_ribbon_command.set_main_window (Current)

			shared_singleton.main_window_cell.put (Current)

			restore_tool_info_from_disk
		end

	init_after_shown
			--
		local
			l_docking_manager: like docking_manager
			l_tool_bar: SD_TOOL_BAR_CONTENT
		do
			create l_docking_manager.make (Current, Current)
			docking_manager := l_docking_manager
			type_selector.attach_to_docking_manager (l_docking_manager)
			layout_constructor.attach_to_docking_manager (l_docking_manager)
			object_editor.attach_to_docking_manager (l_docking_manager)
			size_definition_editor.attach_to_docking_manager (l_docking_manager)
			l_tool_bar := build_tool_bar
			l_docking_manager.tool_bar_manager.contents.extend (l_tool_bar)
			l_tool_bar.set_top ({SD_ENUMERATION}.top)

			save_project_command.disable
			gen_code_command.disable
		end

	user_create_interface_objects
			-- <Precursor>
		local
			l_project_info: ER_PROJECT_INFO
		do
				-- Initialize before calling Precursor all the attached attributes
				-- from the current class.

				-- Proceed with vision2 objects creation.
			create shared_singleton

			create type_selector.make

			create layout_constructor.make

			create object_editor.make

			shared_singleton.object_editor_cell.put (object_editor)

			create l_project_info.make
			shared_singleton.project_info_cell.put (l_project_info)

			create new_project_command.make (new_project_menu)
			create open_project_command.make (open_project_menu)
			create save_project_command.make (save_project_menu)
			create gen_code_command.make
			create recent_project_command.make (recent_projects)
			create new_ribbon_command.make

			create size_definition_editor.make
			shared_singleton.size_definition_cell.put (size_definition_editor)
		end

	build_tool_bar: SD_TOOL_BAR_CONTENT
			--
		local
			l_list: ARRAYED_SET [SD_TOOL_BAR_ITEM]
			l_item: SD_TOOL_BAR_BUTTON
		do
			create l_list.make (10)

			l_item := open_project_command.new_menu_item
			l_list.extend (l_item)

			l_item := save_project_command.new_menu_item
			l_list.extend (l_item)

			l_item := gen_code_command.new_tool_bar_item
			l_list.extend (l_item)

			create Result.make_with_items ("MAIN_TOOL_BAR", l_list)
		end

feature {NONE} -- Agents

	on_new_project_selected
			-- <Precursor>
		do
			new_project_command.execute
		end

	on_open_project_selected
			-- <Precursor>
		do
			open_project_command.execute
		end

	on_new_ribbon_selected
			-- <Precursor>
		do
			new_ribbon_command.execute
		end

	on_save_project_selected
			-- <Precursor>
		do
			save_project_command.execute
		end

	on_exit_selected
			-- <Precursor>
		local
			l_env: EV_ENVIRONMENT
		do
			create l_env
			if attached l_env.application as l_app then
				l_app.destroy
			end
		end

feature {NONE} -- Implementation

	restore_tool_info_from_disk
			--
		local
			l_tool_info: detachable ER_TOOL_INFO

			l_file: RAW_FILE
			l_reader: SED_MEDIUM_READER_WRITER
			l_facility: SED_STORABLE_FACILITIES
			l_constants: ER_MISC_CONSTANTS
		do
			create l_constants
			create l_file.make (l_constants.tool_info_file_name)
			if l_file.exists then
			l_file.open_read
				create l_reader.make (l_file)
				l_reader.set_for_reading
				create l_facility
				if attached {ER_TOOL_INFO} l_facility.retrieved (l_reader, False) as l_tool_info_attached then
					l_tool_info := l_tool_info_attached
				end
				l_file.close
			end

			if l_tool_info = Void then
				create l_tool_info.make
			end

			shared_singleton.tool_info_cell.put (l_tool_info)

			recent_project_command.restore_recent_item_menu
		end

	save_tool_info_when_exit
			--
		local
			l_file: RAW_FILE
			l_writer: SED_MEDIUM_READER_WRITER
			l_facility: SED_STORABLE_FACILITIES
			l_constants: ER_MISC_CONSTANTS
		do
			if attached shared_singleton.tool_info_cell.item as l_tool_info then
				create l_constants
				create l_file.make (l_constants.tool_info_file_name)
				l_file.create_read_write
				create l_writer.make (l_file)
				l_writer.set_for_writing
				create l_facility
				l_facility.store (l_tool_info, l_writer)
				l_file.close
			end
		end

	type_selector: ER_TYPE_SELECTOR
			--

	layout_constructor: ER_LAYOUT_CONSTRUCTOR
			--

	object_editor: ER_OBJECT_EDITOR
			--

	size_definition_editor: ER_SIZE_DEFINITION_EDITOR
			--

	shared_singleton: ER_SHARED_SINGLETON
			--

feature -- Commands

	new_project_command: ER_NEW_PROJECT_COMMAND
			--

	open_project_command: ER_OPEN_PROJECT_COMMAND
			--

	save_project_command: ER_SAVE_PROJECT_COMMAND
			--

	gen_code_command: ER_GENERATE_CODE_COMMAND
			--

	recent_project_command: ER_RECENT_PROJECT_COMMAND
			--

	new_ribbon_command: ER_NEW_RIBBON_COMMAND
			--

feature -- Query

	docking_manager: detachable SD_DOCKING_MANAGER
			--			
end

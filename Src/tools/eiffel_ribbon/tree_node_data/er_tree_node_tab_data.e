note
	description: "Summary description for {ER_TREE_NODE_TAB_DATA}."
	date: "$Date$"
	revision: "$Revision$"

class
	ER_TREE_NODE_TAB_DATA

inherit
	ER_TREE_NODE_DATA

feature -- Command

	update_for_xml_attribute (a_name, a_value: STRING)
			-- <Precursor>
		local
			l_constants: ER_XML_ATTRIBUTE_CONSTANTS
		do
			create l_constants

			if a_name.is_equal (l_constants.command_name) then
				command_name := a_value
			else
				-- Maybe ApplicationModes, or....
				check not_implemented: False end
			end
		end
end

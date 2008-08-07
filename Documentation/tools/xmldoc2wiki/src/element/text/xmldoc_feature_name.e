indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	XMLDOC_FEATURE_NAME

inherit
	XMLDOC_TEXT_CONTAINER
		redefine
			process_visitor
		end

	XMLDOC_LIKE_EIFFEL_LINK

create
	make

feature {XMLDOC_VISITOR} -- Visitor

	process_visitor (v: XMLDOC_VISITOR)
		do
			v.process_feature_name (Current)
		end

end

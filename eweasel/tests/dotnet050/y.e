class Y
inherit
	B[ANY]
	C[ANY]
		rename
			f as g
		select
			g
		end
	$SYSTEM_OBJECT
end

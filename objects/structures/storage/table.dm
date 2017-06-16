obj/structures/storage/table

	name = "table"
	desc = "A wooden table"
	icon_state = "table_b"
	layer = 2.9
	open = 1

	clicked()
		if(!(usr.holding == null))
			usr.holding.put(src)

	New()
		..()
		var/turf/T = src.loc
		var/turf/B = locate(T.x,T.y-1,T.z)
		for(var/I in B.contents)
			if(istype(src,I))
				src.icon_state = "table"
				return


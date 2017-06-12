obj/structures/storage

	icon = 'storage.dmi'

	var/open = 0

	Cross(atom/movable/O)
		if(open == 1)
			if(istype(O,/obj/items) == 1)
				return(1)
			else
				return(0)
		else
			return(0)
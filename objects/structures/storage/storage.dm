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

	Cross(atom/movable/O)
		if(O.density == 1 && src.density == 1)
			if(istype(O,/mob))
				if(anchored == 0)
					if(usr.pulling = src)
						usr.stopPulling()
					step(src,get_dir(O,src))
			else if(istype(O,/obj/items/))
				if(open == 1)
					return 1
			return 0
		else if(O.density == 0 || src.density == 0)
			return 1
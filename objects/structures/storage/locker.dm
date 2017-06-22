obj/structures/storage/locker

	name = "locker"
	desc = "You wonder if you could fit inside..."

	icon_state = "locker_c"

	examined()
		if(lock != null)
			usr << "<SPAN class=examined> It has a [src.lock.name] on it</SPAN>"

	var/obj/items/locks/lock = null

	proc/toggle()

		var/turf/T = src.loc

		if(open == 1)
			open = 0
			density = 1
			icon_state = "locker_c"

			for(var/obj/items/I in T.contents)
				src.contents += I
			for(var/mob/M in T.contents)
				src.contents += M

		else if(open == 0)

			if(lock != null)
				var/L = lock.lockCheck()
				if(L != 1)
					return

			open = 1
			density = 0
			icon_state = "locker_o"

			T.contents += src.contents
			src.contents += src.lock




	clicked()
		if(open == 1)
			if(usr.holding == null)
				toggle()
			else
				usr.holding.put(src)
		else
			if(usr.holding == null)
				toggle()
			else
				if(istype(usr.holding,/obj/items/writing/pen) == 1)
					var/I = input("What do you label the locker?") as text
					src.name = "locker \[[I]\]"
				if(istype(usr.holding,/obj/items/locks))
					if(src.lock == null)
						var/obj/items/locks/H = usr.holding
						src.lock = H
						H.drop()
						src.contents += H


	Cross(atom/movable/O)
		if(open == 1)
			return(1)
		else
			return(0)



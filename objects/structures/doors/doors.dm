obj/structures/doors

	icon = 'doors.dmi'
	icon_state = "closed"

	opacity = 1
	density = 1
	var/transparent = 0

	var/open = 0
	var/openState = "open"
	var/closedState = "closed"
	var/middleState = "middle"

	var/obj/items/locks/lock = null
	var/lockable = 0

	examined()
		..()
		usr << "<SPAN class=examined> It has a [src.lock.name] on it</SPAN>"

	proc/close()
		icon_state = middleState
		density = 1
		sleep(1.5)
		icon_state = closedState
		if(!(transparent == 1))
			opacity = 1
		open = 0

	proc/open()
		if(lock != null)
			var/L = lock.lockCheck()
			if(L != 1)
				usr << "<SPAN class = examine>It is locked!</SPAN>"
				return
		icon_state = middleState
		opacity = 0
		sleep(1.5)
		icon_state = openState
		density = 0
		open = 1

	proc/toggle()
		if(open == 1)
			close()
		else if(open == 0)
			open()

	clicked()
		if(istype(usr.holding,/obj/items/locks))
			if(src.lock == null)
				if(lockable == 1)
					var/obj/items/locks/H = usr.holding
					src.lock = H
					H.drop()
					src.contents += H

		//Add removing locks w/screwdriver... key lock may be hard
		if(istype(usr.holding,/obj/items/key))
			if(istype(lock,/obj/items/locks/key))
				toggle()


		else
			toggle()


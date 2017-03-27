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

	proc/close()
		icon_state = middleState
		density = 1
		sleep(1.5)
		icon_state = closedState
		if(!(transparent == 1))
			opacity = 1
		open = 0

	proc/open()
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
		toggle()
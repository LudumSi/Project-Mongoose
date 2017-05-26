obj/structures/doors/big

	name = "blast door"
	desc = "That's a big door!"

	icon_state = "bigmetal_closed"

	var/preopened = 0

	middleState = "bigmetal_middle"
	openState = "bigmetal_open"
	closedState = "bigmetal_closed"

	signalop = 1

	signaled(keyword)
		if(keyword == "open")
			if(!(open == 1))
				open()
		if(keyword == "close")
			if(!(open == 0))
				close()

	bottom
		dir = NORTH

	New()
		..()
		if(preopened == 1)
			toggle()

	clicked()
		if(!(usr.holding == null))
			if("pry" in usr.holding.properties)
				toggle()
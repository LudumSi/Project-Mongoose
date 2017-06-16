obj/items/food/beans

	name = "can of beans"
	desc = "The magical fruit"
	icon_state = "can_closed"

	foodValue = 2
	bites = 5

	var state = 0
	//0 = closed, 1 = open, 2 = empty

	doneEating()
		state = 2
		icon_state = "can_empty"
		properties.Remove("edible")

	properties = list()

	clicked()
		if(state == 0)
			if(istype(usr.holding,/obj/items/canopener) == 1)
				state = 1
				icon_state = "can_open"
				properties.Add("edible")
			else if("sharp" in usr.holding.properties)
				if(prob(75) == 1)
					state = 2
					icon_state = "can_empty"
					usr << "<SPAN class=examine>You spill the beans!</SPAN>"
				else
					state = 1
					icon_state = "can_open"
					properties.Add("edible")

	inv_clicked()
		clicked()

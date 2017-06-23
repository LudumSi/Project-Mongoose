obj/structures/blood

	name = "blood puddle"
	desc = "Somebody must of gotten hurt here"

	density = 0
	icon_state = "blood"
	var/DNA

	clicked()
		for(var/i in usr.holding.properties)
			if(i == "clean")
				del src

	New()
		src.pixel_x = rand(-16,16)
		src.pixel_y = rand(-16,16)
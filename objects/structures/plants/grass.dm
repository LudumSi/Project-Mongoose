obj/structures/plants/grass

	name = "dead grass"
	desc = "It's dead, Jim"
	icon_state = "grass"

	New()
		pixel_x = rand(-16,16)
		pixel_y = rand(-16,16)
		var flip = rand(0,1)
		if(flip > 0.5)
			icon_state = "grass_flip"
/obj/spawners/nature
	icon = 'objects/structures/plants/plants.dmi'
	icon_state = "grass"

	New()
		var choice = rand(0,3)
		if(choice == 3)
			new /obj/structures/plants/grass(src.loc)
			del src
		else
			del src

/obj/spawners/rubble
	icon = 'objects/structures/structures.dmi'
	icon_state = "rubble"
	New()
		var choice = rand(0,1)
		if(choice == 1)
			new /obj/structures/rubble(src.loc)
			del src
		else
			del src
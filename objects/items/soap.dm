obj/items/food/soap

	name = "soap"
	desc = "You recall long-repressed memories of your childhood"
	icon_state = "soap"


	foodValue = 2
	bites = 2

	properties = list("clean","edible")

	Crossed(atom/movable/O)

		if(istype(O,/mob) == 1)
			var/mob/M = O
			M.stunme(20)

	eaten()
		usr << "You regret swearing"

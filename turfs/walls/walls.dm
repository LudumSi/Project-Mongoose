turf/walls

	name = "A test wall"
	desc = "It burns your eyes"

	icon = 'walls.dmi'
	icon_state = "wall"
	density = 1
	opacity = 1

	var/msg = null


	proc/clean()
		overlays = null
		msg = null

	Click()
		..()
		if(binaryFlagCheck(usr.conditions,MOB_PARALYZED) == 0)
			if(get_dist(usr,src) <= 1)
				var/i
				if(!(usr.holding == null))
					for(i in usr.holding.properties)
						if(i in src.destroy)
							hurtme(1)
						if(i == "clean")
							clean()
				else
					clicked()

	clicked()
		if(istype(usr.holding,/obj/items/spraypaint))
			var/obj/items/spraypaint/H = usr.holding
			msg = input("What do you spraypaint on the wall?") as text
			overlays = null
			var/image/G = image('datum/effects.dmi',src)
			G.icon_state = "graffiti"
			G.color = H.hue
			G.pixel_y = rand(-3,3)
			src.overlays += G

	examined()
		if(!(msg == null))
			usr << "<SPAN class=examine>Someone has spraypainted [msg] onto the wall</SPAN>"


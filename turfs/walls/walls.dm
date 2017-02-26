turf/walls

	name = "A test wall"
	desc = "It burns your eyes"

	icon = 'walls.dmi'
	icon_state = "wall"
	density = 1
	opacity = 1

	var/msg = null

	Click()
		..()
		if(get_dist(usr,src) <= 1)
			var/i
			if(!(usr.holding == null))
				for(i in usr.holding.properties)
					if(i in src.destroy)
						hurtme(1)
				clicked()
			else clicked()

	clicked()
		if(istype(usr.holding,/obj/items/spraypaint))
			msg = input("What do you spraypaint on the wall?") as text

	examined()
		if(!(msg == null))
			usr << "<SPAN class=examine>Someone has spraypainted [msg] onto the wall</SPAN>"
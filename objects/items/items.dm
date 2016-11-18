obj/items

	icon = 'items.dmi'
	density = 0

	verb/pickup()
		set src in range(1)
		if(usr.holding == null)
			usr.holding = src
			if(usr.actvhand == 1)
				usr.hand = src
				if(usr.hand2 == src)
					usr.hand2 = null
				screen_loc = "9,1"
			else if(usr.actvhand == 2)
				usr.hand2 = src
				if(usr.hand == src)
					usr.hand = null
				screen_loc = "8,1"
			src.loc = usr
			usr.client.screen += src

	proc/drop()
		if(usr.holding == src)
			usr.holding = null
			if(usr.hand == src)
				usr.hand = null
			else if(usr.hand2 == src)
				usr.hand2 = null
			usr.client.screen -= src
			src.loc = usr.loc

	Click()
		if(usr.holding == null)
			pickup()
		else
			clicked()




obj/items

	icon = 'items.dmi'
	density = 0

	var/list/properties
	var/list/slots
	var/equip_state = null

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
		if(usr.hand2 == src)
			usr.hand2 = null
		usr.client.screen -= src
		src.loc = usr.loc

	proc/equip(slot)
		drop()
		if(slot == 1)
			usr.clothes = src
			screen_loc = "7,1"
		src.loc = usr
		usr.client.screen += src
		usr.overlayset()

	proc/unequip()
		if(usr.clothes == src)
			usr.clothes = null
		usr.client.screen -= src
		usr.overlayset()
		src.loc = usr.loc
		pickup()

	Click()
		usr.dir = get_dir(usr,src)
		if(get_dist(usr,src) <= 1)
			if(usr.holding == null)
				pickup()
			else
				clicked()






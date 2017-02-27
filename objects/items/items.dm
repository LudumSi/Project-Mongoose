obj/items

	icon = 'items.dmi'
	density = 0

	var/pickup = 1
	var/list/properties
	var/list/slots
	var/equip_state = null
	var/equiped = 0
	var/size = 3
	/*
	1= tiny
	2= small
	3 = medium
	4 = large
	5 = huge
	*/

	verb/pickup()
		set src in range(1)
		if(pickup == 1)
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
			screen_loc = "6,1"
		if(slot == 2)
			usr.hat = src
			screen_loc = "5,1"
		src.loc = usr
		usr.client.screen += src
		usr.overlayset()
		pickup = 0

	proc/unequip(slot)
		if(slot == 1)
			usr.clothes = null
		if(slot == 2)
			usr.hat = null
		usr.client.screen -= src
		usr.overlayset()
		pickup = 1
		src.loc = usr.loc
		pickup()


	proc/shift_inv_clicked()
	proc/inv_clicked()

	Click(location,control,params)
		params=params2list(params)
		..()
		if(get_dist(usr,src) <= 1)
			if(usr.holding == null)
				pickup()
			else if(usr.holding == src)
				if("shift" in params)
					shift_inv_clicked()
				else
					inv_clicked()
			else
				clicked()

	destroyme()
		del src






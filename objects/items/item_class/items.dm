obj/items

	icon = 'objects/items/items.dmi'
	density = 0

	var/pickup = 1
	var/list/properties

	var/equip_state = null
	var/equiped = 0
	var/size = 3
	var throwing = 0
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

	proc/shift_inv_clicked()
	proc/inv_clicked()

	Click(location,control,params)
		params=params2list(params)
		..()
		if(get_dist(usr,src) <= 1)
			if(usr.holding == null)
				pickup()
			else if(src.loc == usr)
				if("shift" in params)
					shift_inv_clicked()
				else
					inv_clicked()
			else
				clicked()

	destroyme()
		del src


	proc/thrown(atom/target)
		drop()

		for(var/obj/buttons/throwing/T in usr.client.screen)
			T.icon_state = "rev_halfbutton"

		var oldDense = density
		var oldDist = get_dist(src,target)+1

		while(get_dist(src,target) < oldDist)
			density = 1
			step(src,get_dir(src,target),0)
			oldDist -= 1
			density = oldDense








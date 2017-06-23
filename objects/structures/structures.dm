obj/structures

	icon = 'structures.dmi'

	var/list/destroy
	var/signalop = 0
	var/keycode
	var/anchored = 1
	var/anchor_toggle = 0

	proc/signaled(keyword)

	Click(location,control,params)
		..()
		params=params2list(params)
		if(binaryFlagCheck(usr.conditions,MOB_PARALYZED) == 0)
			if(get_dist(usr,src) <= 1)
				if("ctrl" in params)
					if(anchored == 0)
						usr.pulling = src
						usr.client.screen += new/obj/buttons/pulling
				var/i
				if(!(usr.holding == null))
					for(i in usr.holding.properties)
						if(i in src.destroy)
							hurtme(1)
							return
					clicked()
				else
					clicked()

	examined()
		if(HP.value == HP.max_value)
			usr << "<SPAN CLASS=examine> It looks undamaged </SPAN>"
		else if(HP.value < HP.max_value)
			if(HP.value >= (HP.max_value/2))
				usr << "<SPAN CLASS=examine> It looks slightly beat-up </SPAN>"
			if(HP.value << (HP.max_value/2))
				usr << "<SPAN CLASS=warning> It looks quite damaged </SPAN>"

	Cross(atom/movable/O)
		if(O.density == 1 && src.density == 1)
			if(istype(O,/mob))
				if(anchored == 0)
					if(usr.pulling = src)
						usr.stopPulling()
					step(src,get_dir(O,src))
			return 0
		else if(O.density == 0 || src.density == 0)
			return 1
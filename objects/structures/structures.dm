obj/structures

	icon = 'structures.dmi'

	var/list/destroy
	var/signalop = 0
	var/keycode

	proc/signaled(keyword)

	Click()
		..()
		if(binaryFlagCheck(usr.conditions,MOB_PARALYZED) == 0)
			if(get_dist(usr,src) <= 1)
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
		else if(HP.value << HP.max_value)
			if(HP.value >= (HP.max_value/2))
				usr << "<SPAN CLASS=examine> It looks slightly beat-up </SPAN>"
			if(HP.value << (HP.max_value/2))
				usr << "<SPAN CLASS=warning> It looks quite damaged </SPAN>"
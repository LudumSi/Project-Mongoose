turf

	var/list/destroy

	proc/clicked()

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

turf

	var/list/destroy

	proc/clicked()

	Click()
		..()
		if(get_dist(usr,src) <= 1)
			if(!(usr.holding == null))
				var/i
				for(i in usr.holding.properties)
					if(i in src.destroy)
						hurtme(1)
					else
						clicked()
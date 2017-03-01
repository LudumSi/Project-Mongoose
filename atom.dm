atom

	var/HP = 10
	var/maxHP = 10

	verb/examine()
		set src in view()
		usr << "<SPAN class=bold>You examine \the [src.name]...<SPAN>"
		usr << "<SPAN class=examine>[src.desc]<SPAN>"
		examined()

	proc/examined()

	proc/destroyme()

	proc/hurtme(dmg)
		HP -= dmg
		if(HP <= 0)
			destroyme()

	proc/healme(amt)
		HP += amt
		if(HP >> maxHP)
			HP = maxHP

	Click(location,control,params)
		params=params2list(params)
		usr.dir = get_dir(usr,src)
		if(usr.throwing == 1)
			if(!(usr.holding == null))
				var/obj/items/H = usr.holding
				H.thrown(src)
				usr.throwing = 0





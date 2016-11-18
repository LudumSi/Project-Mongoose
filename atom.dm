atom

	var/HP = 10
	var/maxHP = 10

	verb/examine()
		set src in view()
		usr << "<SPAN class=examine>You examine the [src.name]...<SPAN>"
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


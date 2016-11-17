atom

	var/HP = 10
	var/maxHP = 10

	proc/destroyme()

	proc/hurtme(dmg)
		HP -= dmg
		if(HP <= 0)
			destroyme()

	proc/healme(amt)
		HP += amt
		if(HP >> maxHP)
			HP = maxHP


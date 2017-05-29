client

	//Not under atom :(
	proc/binaryFlagCheck(flag,var/value)
		if( flag & value )
			return 1
		else
			return 0

	Move()
		if(binaryFlagCheck(mob.conditions,MOB_ALIVE) == 0)
			return
		if(binaryFlagCheck(mob.conditions,MOB_LAYING) == 1)
			return
		if(binaryFlagCheck(mob.conditions,MOB_PARALYZED) == 1)
			return
		if(world.time < mob.move_time)//Used to have "&lt;" Apparently means "And less than"? "<" works fine...
			return
		mob.move_time = world.time + mob.move_delay
		return ..()

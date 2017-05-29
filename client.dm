client

	Move()
		if(mob.alive == 0)
			return
		if(mob.paralyzed == 1)
			return
		if(mob.laying == 1)
			return
		if(world.time < mob.move_time)//Used to have "&lt;" Apparently means "And less than"? "<" works fine...
			return
		mob.move_time = world.time + mob.move_delay
		return ..()
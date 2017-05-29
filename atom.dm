atom

	var/startHP = 10
	var/stat/HP

	New()
		HP = new(startHP)

	verb/examine()
		set src in view()
		usr << "<SPAN class=bold>You examine \the [src.name]...<SPAN>"
		usr << "<SPAN class=examine>[src.desc]<SPAN>"
		examined()

	proc/examined()

	proc/orthoRotate(direction)
		if(direction == "cw")
			if(dir == SOUTH)
				dir = WEST
			else if(dir == WEST)
				dir = NORTH
			else if(dir == NORTH)
				dir = EAST
			else if(dir == EAST)
				dir = SOUTH
		else if(direction == "ccw")
			if(dir == SOUTH)
				dir = EAST
			else if(dir == WEST)
				dir = SOUTH
			else if(dir == NORTH)
				dir = WEST
			else if(dir == EAST)
				dir = NORTH


	proc/destroyme()

	proc/hurtme(dmg)
		HP.value -= dmg
		if(HP.value <= 0)
			destroyme()

	proc/healme(amt)
		HP.Add(amt)

	Click(location,control,params)
		params=params2list(params)
		usr.dir = get_dir(usr,src)
		if(usr.throwing == 1)
			if(!(usr.holding == null))
				var/obj/items/H = usr.holding
				H.thrown(src)
				usr.throwing = 0

	proc/binaryFlagCheck(bits,var/value)
		if( bits & value )
			return 1
		else
			return 0

	proc/binaryFlagAdd(bits,var/value)
		bits = bits | value
		return bits


	proc/binaryFlagRemove(bits,var/value)
		bits = bits & (~ value)
		return bits







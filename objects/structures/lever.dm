obj/structures/lever

	name = "lever"
	desc = "Pronounced lee-ver"
	icon_state = "lever_1"

	var/position = 0
	var/keyword1 = null
	var/keyword2 = null
	var/range = 0

	proc/signal(keyword)
		for(var/obj/structures/S in range(range))
			if(S.signalop == 1)
				if(S.keycode == keycode)
					S.signaled(keyword)

	clicked()
		if(position == 0)
			icon_state = "lever_2"
			position = 1
			signal(keyword1)
		else if(position == 1)
			icon_state = "lever_1"
			position = 0
			signal(keyword2)

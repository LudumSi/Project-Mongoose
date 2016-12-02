//Used for stacks of items
obj/items/stacks

	var/stack
	var/stack_lim

	examined()
		usr << "<SPAN class=examine>It has [stack]/[stack_lim] items left<SPAN>"

	proc/stack_check(num)
	//checks to see if there is a certain number in the stack
		if(src.stack >= num)
			return 1
		else
			return 0

	proc/stack_take(num)
		if(stack_check(num) == 1)
			src.stack -= num
			if(src.stack <= 0)
				destroyme()

	proc/stack_room(num)
		if((src.stack_lim - src.stack) >= num)
			return 1
		else
			return 0

	proc/stack_add(num)
		if(stack_room(num) == 1)
			src.stack += num

	//creates a new stack with the "num" as the stack, if possible
	proc/stack_split(num)
		if(num == 0)
			return
		else if(num <= stack_lim)
			if(stack_check(num) == 1)
				var/obj/items/stacks/S = new src.type(src.loc)
				S.stack = num
				src.stack_take(num)

	//adds to another stack,"pushes"
	proc/stack_push(target,num)

		var/obj/items/stacks/T = target
		var/room = T.stack_room(num)
		var/enough = src.stack_check(num)
		if(enough == 1)
			if(room == 1)
				T.stack_add(num)
				src.stack_take(num)
			if(room == 0)
				var/diff = (T.stack_lim - T.stack)
				T.stack_add(diff)
				src.stack_take(diff)
		else if(enough == 0)
			if(room == 1)
				var/can = (num - src.stack)
				T.stack_add(can)
				src.stack_take(can)
			if(room == 0)
				return

	proc/stack_pull(target,num)

		var/obj/items/stacks/T = target
		var/room = src.stack_room(num)
		var/enough = T.stack_check(num)
		if(enough == 1)
			if(room == 1)
				src.stack_add(num)
				T.stack_take(num)
			if(room == 0)
				var/diff = (src.stack_lim - src.stack)
				src.stack_add(diff)
				T.stack_take(diff)
		else if(enough == 0)
			if(room == 1)
				var/can = (num - T.stack)
				src.stack_add(can)
				T.stack_take(can)
			if(room == 0)
				return

	stack = 10
	stack_lim = 10

	clicked()
		if(istype(usr.holding,src))
			var/obj/items/stacks/H = usr.holding
			if(loc == usr)
				stack_pull(H,H.stack)
			else
				stack_push(H,src.stack)

	inv_clicked()
		var/N = input("How many do you want to take (1 to [stack])?") as num
		src.drop()
		src.stack_split(N)
		src.pickup()


/obj/items/stacks/bricks

	name = "concrete bricks"
	desc = "A hefty pile of bricks"
	icon_state = "bricks"
	stack_lim = 10

	/*
	inv_clicked()
		if(!(/obj/structures in usr.loc))
			new/obj/structures/bars(usr.loc)
			stack_take(2)
	*/
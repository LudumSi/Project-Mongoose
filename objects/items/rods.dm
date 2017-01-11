/obj/items/stacks/rods

	name = "Metal rods"
	desc = "A stack of metal rods"
	icon_state = "rods"
	stack_lim = 10

	inv_clicked()
		if(!(/obj/structures in usr.loc))
			new/obj/structures/bars(usr.loc)
			stack_take(2)
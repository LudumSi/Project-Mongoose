/obj/items/stacks/rods

	name = "Metal rods"
	desc = "A stack of metal rods"
	icon_state = "rods"

	inv_clicked()
		if(!(/obj/structures in usr.loc))
			new/obj/structures/rebar(usr.loc)
			stack_take(2)
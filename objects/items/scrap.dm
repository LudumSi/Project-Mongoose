/obj/items/stacks/scrap

	name = "scrap metal"
	desc = "Distressed, rusted metal"
	icon_state = "scrap"
	stack_lim = 10

	inv_clicked()
		if(!(/obj/structures in usr.loc))
			new/obj/structures/bars(usr.loc)
			stack_take(2)
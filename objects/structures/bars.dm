obj/structures/bars

	name = "bars"
	desc = "A row of metal bars"

	icon_state = "bars"
	layer = 3.1

	HP = 2
	maxHP = 2

	destroy = list("cutting")

	destroyme()
		var/obj/items/stacks/rods/R = new(src.loc)
		R.stack = 2
		del src

	clicked()
		if(!(usr.holding == null))
			if(istype(usr.holding,/obj/items/stacks/rods))
				var/obj/items/stacks/R = usr.holding
				if(R.stack >= 2)
					R.stack_take(2)
					new/obj/structures/rebar(src.loc)
					del src
			else if(usr.holding.size <= 2)
				var/obj/items/H = usr.holding
				H.drop()
				H.loc = src.loc
				view() << "[usr] squeezes [H] through the bars"


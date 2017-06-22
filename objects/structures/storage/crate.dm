obj/structures/storage/crate

	name = "crate"
	desc = "Watch out for splinters"
	icon_state = "crate_c"

	anchored = 0

	open = 0

	clicked()
		if(open == 0)
			if("pry" in usr.holding.properties)
				open = 1
				icon_state = "crate_o"
				var/obj/items/stacks/planks/P = new(usr.loc)
				P.stack = 1
			else if(istype(usr.holding,/obj/items/writing/pen) == 1)
				var/I = input("What do you label the crate?") as text
				src.name = "crate \[[I]\]"
		else
			if(usr.holding == null)
				usr << "<SPAN class=examine>You root around in the crate</SPAN>"
				var/atom/C = pick(src.contents)
				src.loc.contents += C
			else if(istype(usr.holding,/obj/items/stacks/planks) == 1)
				var/obj/items/stacks/planks/P = usr.holding
				if(P.stack_check(1) == 1)
					open = 0
					icon_state = "crate_c"
					P.stack_take(1)
			else
				var/obj/items/H = usr.holding
				if(contents.len < 20)
					H.drop()
					src.contents += H

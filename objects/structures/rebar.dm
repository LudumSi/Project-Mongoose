obj/structures/rebar

	icon_state = "rebar"
	HP = 2

	destroyme()
		new/obj/structures/rebar/broken(src.loc)
		del src


	clicked()
		if("cutting" in usr.holding.properties)
			hurtme(1)

	broken
		icon_state = "rebar_broken"
		density = 0
		HP = 2
		clicked()
			if("cutting" in usr.holding.properties)
				hurtme(1)

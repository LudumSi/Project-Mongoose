obj/structures/rebar

	name = "rebar"
	desc = "A grille made of rusted metal rods"

	icon_state = "rebar"
	layer = 3.5

	startHP = 2

	destroy = list("cutting")

	destroyme()
		new/obj/structures/rebar/broken(src.loc)
		var/obj/items/stacks/rods/R = new(src.loc)
		R.stack = 2
		del src

	broken
		desc = "A broken grille made of rusted metal rods"
		icon_state = "rebar_broken"

		density = 0

		destroyme()
			var/obj/items/stacks/rods/R = new(src.loc)
			R.stack = 2
			del src



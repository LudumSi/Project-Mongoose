obj/structures/rebar

	name = "Rebar"
	desc = "A grille made of rusted metal rods"

	icon_state = "rebar"
	layer = 3.2

	HP = 2
	maxHP = 2

	destroy = list("cutting")

	destroyme()
		new/obj/structures/rebar/broken(src.loc)
		del src

	broken
		desc = "A broken grille made of rusted metal rods"
		icon_state = "rebar_broken"

		density = 0



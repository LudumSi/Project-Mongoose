turf/walls/concrete

	name = "Concrete wall"
	desc = "A block of solid concrete"
	icon_state = "concrete"

	destroy = ("hammer")
	HP = 20
	maxHP = 20

	destroyme()
		new/obj/structures/rebar(src.loc)
		new/obj/structures/rubble(src.loc)
		new/turf/floors/wasteland(src.loc)
		del src
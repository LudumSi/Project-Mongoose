turf/walls/concrete

	name = "Concrete wall"
	desc = "A block of solid concrete"
	icon_state = "concrete"

	HP = 20
	maxHP = 20

	destroy = list("hammer")

	destroyme()
		new/obj/structures/rebar(src)
		new/obj/structures/rubble(usr.loc)
		new/turf/walls/concrete/cracked(src)


turf/walls/concrete

	name = "Concrete wall"
	desc = "A block of solid concrete"
	icon_state = "concrete"

	HP = 20
	maxHP = 20

	destroy = list("hammer")

	destroyme()
		new/obj/structures/rubble(src)
		new/turf/floors/wasteland(src)


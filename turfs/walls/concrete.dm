turf/walls/concrete

	name = "concrete wall"
	desc = "A block of solid concrete, formed by ancient hands"
	icon_state = "concrete"

	startHP = 20

	destroy = list("hammer")

	destroyme()
		new/obj/structures/rubble(src)
		new/turf/floors/wasteland(src)


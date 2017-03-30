obj/structures/chair

	name = "chair"
	desc = "You sit in this"
	icon_state = "wood_chair"

	density = 0
	opacity = 0

	proc/layercheck()
		if(dir == SOUTH)
			layer = 3
		else
			layer = 4.1

	New()
		layercheck()


	clicked()
		orthoRotate("cw")
		layercheck()


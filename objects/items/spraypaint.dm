/obj/items/spraypaint

	icon_state = "spraypaint"
	name = "Spray-paint"
	desc = "You could draw some wicked stuff with this"

	var/hue = rgb(255,0,0)

	New()
		var/image/M = image('items.dmi',src)
		M.icon_state = "spraypaint_mask"
		M.color = src.hue
		src.overlays += M

	random
		New()
			hue = rgb(rand(0,255),rand(0,255),rand(0,255))
			..()


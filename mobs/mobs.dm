mob

	opacity = 0
	density = 1
	icon = 'mobs.dmi'
	step_size = 32

	var/obj/items/holding = null
	var/obj/items/clothes = null
	var/obj/items/hat = null
	var/hand = null
	var/hand2 = null
	var/actvhand = 1
	var/throwing = 0

	proc/clicked()
	proc/overlayset()
		var/L[2]
		if(clothes)
			L += image(clothes.icon,icon_state = clothes.icon_state)
		if(hat)
			L += image(hat.icon,icon_state = clothes.icon_state)
		overlays = L

	Click()
		..()
		if(get_dist(usr,src) <= 1)
			clicked()

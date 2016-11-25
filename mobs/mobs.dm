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
	var/image/skin = null

	proc/clicked()
	proc/overlayset()
		var/L[3]
		L += skin
		if(clothes)
			L += image(usr.clothes.icon, icon_state = usr.clothes.equip_state)
		if(hat)
			L += image(usr.clothes.icon, icon_state = usr.clothes.equip_state)
		usr.overlays = L

	Click()
		usr.dir = get_dir(usr,src)
		if(get_dist(usr,src) <= 1)
			clicked()

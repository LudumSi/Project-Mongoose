mob

	opacity = 0
	density = 1
	icon = 'mobs.dmi'
	step_size = 32

	var/obj/items/holding = null
	var/hand = null
	var/hand2 = null
	var/actvhand = 1

	proc/clicked()

	Click()
		usr.dir = get_dir(usr,src)
		clicked()
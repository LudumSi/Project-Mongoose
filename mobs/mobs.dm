mob

	opacity = 0
	density = 1
	icon = 'mobs.dmi'
	step_size = 32

	var/alive = 1
	var/laying = 0

	var/obj/items/holding = null
	var/obj/items/clothes = null
	var/obj/items/hat = null
	var/hand = null
	var/hand2 = null
	var/actvhand = 1
	var/throwing = 0

	var/stat/hunger
	var/startHunger = 10

	var/paralyzed = 0

	var/move_delay = 2
	var/tmp/move_time = 0

	proc/clicked()

	proc/overlayset()
		var/L[2]
		if(clothes)
			L += image(clothes.icon,icon_state = clothes.icon_state)
		if(hat)
			L += image(hat.icon,icon_state = clothes.icon_state)
		overlays = L

	proc/laydown() //TODO: Fix clothes
		usr.icon = turn(usr.icon,90)
		laying = 1

	proc/getup()
		usr.icon = turn(usr.icon,-90)
		laying = 0

	destroyme()
		laydown()
		paralyzed = 1
		alive = 0


	proc/lifeLoop()
		hunger.value -= 1

		if(hunger.value == startHunger/2)
			src << "<SPAN class=combat>You feel hungry</SPAN>"
		if(hunger.value == startHunger/5)
			src << "<SPAN class=harm>You really need to eat!</SPAN>"
		if(hunger.value == 0) //Will happen in about 8 minutes (For testing)
			src << "<SPAN class=harm>You die of starvation!</SPAN>"
			src.destroyme()
		if(alive == 1)
			spawn(100) lifeLoop() //Every 10 seconds

	Click()
		..()
		if(get_dist(usr,src) <= 1)
			clicked()

	New()
		..()
		hunger = new(startHunger)
		lifeLoop()


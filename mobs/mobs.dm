/*
#define MOB_ALIVE 1
#define MOB_PARALYZED 2
#define MOB_LAYING 4
*/

mob
	opacity = 0
	density = 1
	icon = 'mobs.dmi'
	step_size = 32

	var/conditions = 1

	var/obj/items/holding = null
	var/obj/items/clothes = null
	var/obj/items/hat = null
	var/hand = null
	var/hand2 = null
	var/actvhand = 1
	var/throwing = 0

	var/language = "English"
	var/list/languages
	languages = list("English")

	var/stat/hunger
	var/startHunger = 75 //Calculations: Time untill death = StartHunger * 100tics (1 tic = 1/10 of a second). 75 give about 12 minutes

	var/move_delay = 2
	var/tmp/move_time = 0

	proc/clicked()

	proc/eat(target)
		var/obj/items/food/H = target
		usr << "<SPAN CLASS=examine> You nibble on [H] <SPAN CLASS=examine>"
		hunger.Add(H.foodValue)
		H.eaten()
		H.bites --
		if(H.bites <= 0)
			H.doneEating()
			usr << "<SPAN CLASS=examine> All gone! </SPAN>"

	proc/overlayset()
		var/L[2]
		if(clothes)
			L += image(clothes.icon,icon_state = clothes.equip_state)
		if(hat)
			L += image(hat.icon,icon_state = clothes.equip_state)
		overlays = L

	proc/laydown() //Matrices fixed the clothing issue... go figure
		var/matrix/M = matrix()
		M.Turn(90)
		src.transform = M
		src.conditions = binaryFlagAdd(src.conditions,MOB_LAYING)

	proc/getup()
		var/matrix/M = matrix()
		src.transform = M
		src.conditions = binaryFlagRemove(src.conditions,MOB_LAYING)

	proc/stunme(stuntime)
		laydown()
		src.conditions = binaryFlagAdd(src.conditions,MOB_PARALYZED)
		sleep(stuntime)
		getup()
		src.conditions = binaryFlagRemove(src.conditions,MOB_PARALYZED)


	destroyme()
		laydown()
		src.conditions = binaryFlagAdd(src.conditions,MOB_ALIVE)

	proc/lifeLoop()
		hunger.value -= 1

		if(hunger.value == startHunger/2)
			src << "<SPAN class=combat>You feel hungry</SPAN>"
		if(hunger.value == startHunger/5)
			src << "<SPAN class=harm>You really need to eat!</SPAN>"
		if(hunger.value == 0) //Will happen in about 8 minutes (For testing)
			src << "<SPAN class=harm>You die of starvation! [world.time]</SPAN>"
			src.destroyme()

		if(binaryFlagCheck(src.conditions,MOB_ALIVE) == 1)
			spawn(100) lifeLoop() //Every 10 seconds
		else
			return
		return //Just to make sure...

	Click()
		..()
		if(binaryFlagCheck(usr.conditions,MOB_PARALYZED) == 0)
			if(get_dist(usr,src) <= 1)
				clicked()

	New()
		..()
		hunger = new(startHunger)
		lifeLoop()


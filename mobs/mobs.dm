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

	startHP = 100

	var/intent = 0 //0 is help, 1 is harm

	var/conditions = 1

	var/DNA

	var/obj/items/holding = null
	var/obj/items/clothes = null
	var/obj/items/hat = null
	var/obj/items/hand = null
	var/obj/items/hand2 = null
	var/actvhand = 1
	var/throwing = 0
	var/atom/movable/pulling = null

	var/language = "English"
	var/list/languages
	languages = list("English")

	var/stat/hunger
	var/startHunger = 75 //Calculations: Time untill death = StartHunger * 100tics (1 tic = 1/10 of a second). 75 give about 12 minutes

	var/action_speed = 9 // ACTION_RATE/action_speed = tics. 30/10 gives 3
	var/tmp/action = NO_ACTION
	var/tmp/action_count

	var/cutArm = 0
	var/impArm = 0
	var/crushArm = 0

	var/bruteDmg = 0

	var/bleed = 0

	hurtme(amt,dmgkind)
		HP.value -= amt
		if(dmgkind == "brute")
			bruteDmg += amt
		if(HP.value <= 0)
			destroyme()

	healme(amt,dmgkind)
		HP.Add(amt)
		if(dmgkind == "brute")
			bruteDmg -= amt

	proc/attackme(dmg,dmgtype,pierce)
		if(dmgtype == "imp")
			hurtme(dmg*(1/impArm),"brute")
			bleed += dmg/8
		if(dmgtype == "cut")
			hurtme(dmg*(1/cutArm),"brute")
			bleed += dmg/4
		if(dmgtype == "crush")
			hurtme(dmg*(1/crushArm),"brute")


	proc/clicked()
		if(istype(usr.holding,/obj/items))
			if(istype(usr.holding,/obj/items/bandage))
				src.bleed = 0
				usr << "<SPAN class=examine>You quench the bleeding</SPAN>"
				del usr.holding
			if(usr.holding.maxDmg != 0)
				attackme(rand(usr.holding.minDmg,usr.holding.maxDmg),usr.holding.damageType,usr.holding.armorPierce)
				src << "<SPAN class=harm>[usr] hits you with the [usr.holding]!</SPAN>"



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

	proc/dropitall()
		hand.drop()
		hand2.drop()


	proc/stunme(stuntime)
		laydown()
		src.conditions = binaryFlagAdd(src.conditions,MOB_PARALYZED)
		dropitall()
		sleep(stuntime)
		getup()
		src.conditions = binaryFlagRemove(src.conditions,MOB_PARALYZED)

	proc/bleed()
		hurtme(bleed,"bleed")
		var/obj/structures/blood/B = new(src.loc)
		B.DNA = src.DNA

	destroyme()
		laydown()
		dropitall()
		src.conditions = binaryFlagAdd(src.conditions,MOB_ALIVE)

	proc/lifeLoop()
		hunger.value -= 1

		if(hunger.value == startHunger/2)
			src << "<SPAN class=combat>You feel hungry</SPAN>"
		if(hunger.value == startHunger/5)
			src << "<SPAN class=harm>You really need to eat!</SPAN>"
		if(hunger.value == 0) //Will happen in about 8 minutes (For testing)
			src << "<SPAN class=harm>You die of starvation!</SPAN>"
			src.destroyme()

		if(bleed > 0)
			usr.bleed()

		if(binaryFlagCheck(src.conditions,MOB_ALIVE) == 1)
			spawn(100) lifeLoop() //Every 10 seconds

		else
			return
		return //Just to make sure...

	proc/stopPulling()
		src.pulling = null
		for(var/obj/buttons/I in src.client.screen)
			if(istype(I,/obj/buttons/pulling))
				del I


	proc/moveLoop()
		src.action_count += src.action_speed
		if(action_count >= ACTION_RATE)
			action_count -= ACTION_RATE
			if(action)
				if(binaryFlagCheck(src.conditions,MOB_LAYING) == 0)
					var/old_loc = src.loc
					step(src,action)
					if(pulling != null)
						if(get_dist(src,pulling) <= 2)
							step(pulling,get_dir(pulling,old_loc))
						else
							stopPulling()
			action = NO_ACTION
		spawn(1) moveLoop()
		return


	Click(location,control,params)
		..()
		params=params2list(params)
		if(binaryFlagCheck(usr.conditions,MOB_PARALYZED) == 0)
			if(get_dist(usr,src) <= 1)
				if("ctrl" in params)
					if( usr != src )
						usr.pulling = src
						usr.client.screen += new/obj/buttons/pulling
				else
					clicked()

	New()
		..()
		hunger = new(startHunger)
		lifeLoop()
		moveLoop()


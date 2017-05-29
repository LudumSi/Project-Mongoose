/*
#define E_SLOT_UNIFORM 1
#define E_SLOT_HAT 2
#define E_SLOT_ARMOUR 4
#define E_SLOT_SHOES 8
*/
//I did it this way so I could have things like hoodies that took up armour and head, for example.

obj/items

	var/slots = 0
	var/current_slots = 0

	proc/equip(attempt) //At some point use bitmaps for slots...
		drop()

		if(binaryFlagCheck(slots,attempt) == 1)
			usr.clothes = src
			screen_loc = "5,1"
			current_slots = binaryFlagAdd(current_slots,E_SLOT_UNIFORM)

		if(binaryFlagCheck(slots,attempt) == 1)
			usr.hat = src
			screen_loc = "6,1"
			current_slots = binaryFlagAdd(current_slots,E_SLOT_HAT)

		src.loc = usr
		usr.client.screen += src
		usr.overlayset()
		pickup = 0

	proc/unequip()
		if(binaryFlagCheck(current_slots,E_SLOT_UNIFORM) == 1)
			usr.clothes = null
			current_slots = binaryFlagRemove(current_slots,E_SLOT_UNIFORM)

		if(binaryFlagCheck(current_slots,E_SLOT_HAT) == 1)
			usr.hat = null
			current_slots = binaryFlagRemove(current_slots,E_SLOT_HAT)

		usr.client.screen -= src
		usr.overlayset()
		pickup = 1
		src.loc = usr.loc
		pickup()
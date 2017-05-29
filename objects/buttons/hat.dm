obj/buttons/hat

	icon_state = "buttonbase"
	screen_loc = "5,1"

	Click()
		var/obj/items/I = usr.holding
		var/obj/items/H = usr.hat
		if(!(usr.holding == null))
			if(usr.hat == null)
				if(binaryFlagCheck(I.slots,E_SLOT_HAT) == 1)
					I.equip(E_SLOT_HAT)
		else
			if(!(H == null))
				H.unequip()
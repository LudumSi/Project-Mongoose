obj/buttons/clothes

	icon_state = "buttonbase"
	screen_loc = "6,1"

	Click()
		var/obj/items/I = usr.holding
		var/obj/items/C = usr.clothes
		if(!(usr.holding == null))
			if(usr.clothes == null)
				if(binaryFlagCheck(I.slots,E_SLOT_UNIFORM) == 1)
					I.equip(E_SLOT_UNIFORM)
		else
			if(!(C == null))
				C.unequip()






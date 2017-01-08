obj/buttons/clothes

	icon_state = "buttonbase"
	screen_loc = "6,1"

	Click()
		var/obj/items/I = usr.holding
		var/obj/items/C = usr.clothes
		if(!(usr.holding == null))
			if(usr.clothes == null)
				if("clothes" in I.slots)
					I.equip(1)
		else
			if(!(C == null))
				C.unequip()




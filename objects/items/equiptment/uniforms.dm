/obj/items/equipment/uniform

	slots = 1
	icon_state = "uniform"
	equip_state = "uniform_e"

	security

		icon_state = "sec"
		equip_state = "sec_e"

		equiped()
			usr.cutArm += 10
			usr.impArm += 10

		unequiped()
			usr.cutArm -= 10
			usr.impArm -= 10

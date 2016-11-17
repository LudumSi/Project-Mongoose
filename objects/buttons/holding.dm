/obj/buttons/holding

	icon_state = "selected"
	screen_loc = "6,1"

	Click()
		usr.actvhand = 1
		usr.holding = usr.hand
		icon_state = "selected"
		for(var/obj/buttons/second/S in usr.client.screen)
			S.icon_state = "buttonbase"
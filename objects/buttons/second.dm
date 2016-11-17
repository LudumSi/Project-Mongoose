/obj/buttons/second

	icon_state = "buttonbase"
	screen_loc = "5,1"

	Click()
		usr.actvhand = 2
		usr.holding = usr.hand2
		icon_state = "selected"
		for(var/obj/buttons/holding/H in usr.client.screen)
			H.icon_state = "buttonbase"


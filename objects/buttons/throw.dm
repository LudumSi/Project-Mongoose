obj/buttons/throwing

	icon_state = "rev_halfbutton"
	screen_loc = "10,1"

	Click()
		if(usr.throwing == 1)
			usr.throwing = 0
			icon_state = "rev_halfbutton"
		else if(usr.throwing == 0)
			usr.throwing = 1
			icon_state = "rev_halfbutton_sel"
obj/buttons/health

	screen_loc = "13,7"
	icon_state = "heart"

	Click()
		usr << "<SPAN class=warning>You have [usr.HP.value] left </SPAN>"
		usr << "<SPAN class=warning>You have taken [usr.bruteDmg] brute damage</SPAN>"
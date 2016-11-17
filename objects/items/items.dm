obj/items

	icon = 'items.dmi'
	density = 0

	verb/pickup()
		if(usr.holding == null)
			usr.holding = src
			screen_loc = "6,1"
			src.loc = usr
			usr.client.screen += src

	proc/drop()
		if(usr.holding == src)
			usr.holding = null
			usr.client.screen -= src
			src.loc = usr.loc

	Click()
		pickup()



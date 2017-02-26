/mob/player

	name = "Unkown"
	desc = "A human bean"

	icon_state = "player"

	Login()
		name = input("What is your name?") as text

		src.client.screen += new/obj/buttons/holding
		src.client.screen += new/obj/buttons/second
		src.client.screen += new/obj/buttons/drop
		src.client.screen += new/obj/buttons/clothes
		//src.client.screen += new/obj/buttons/hat
		var/obj/items/equipment/peasant/P = new(src.loc)
		P.equip(1)

		loc = locate(/turf/floors/spawn)

		overlayset()

	examined()
		if(!(src.holding == null))
			usr << "<SPAN CLASS=examine> A [src.holding] is in their hand </SPAN>"
		if(!(src.clothes == null))
			usr << "<SPAN CLASS=examine> They are wearing [src.clothes] </SPAN>"

	verb/say(msg as text)
		view() << "[src.name] says \"[msg]\" "


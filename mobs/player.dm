/mob/player

	desc = "A human bean"
	icon_state = "player"

	Login()

		gender = input("Select a gender for your character.","Your Gender",gender) in list("male","female","neuter")

		src.client.screen += new/obj/buttons/holding
		src.client.screen += new/obj/buttons/second
		src.client.screen += new/obj/buttons/drop
		src.client.screen += new/obj/buttons/clothes
		//src.client.screen += new/obj/buttons/hat
		src.client.screen += new/obj/buttons/throwing
		var/obj/items/equipment/peasant/P = new(src.loc)
		P.equip(1)

		loc = locate(/turf/floors/spawn)

		overlayset()

		var/names/N = new(gender)
		name = N.name






	examined()
		if(!(src.holding == null))
			usr << "<SPAN CLASS=examine> \icon[src.holding] A [src.holding] is in their hand </SPAN>"
		if(!(src.clothes == null))
			usr << "<SPAN CLASS=examine> \icon[src.clothes] They are wearing [src.clothes] </SPAN>"

	verb/say(msg as text)
		view() << "[src.name] says \"[msg]\" "

	verb/lay()
		if(laying == 1)
			getup()
		else if(laying == 0)
			laydown()


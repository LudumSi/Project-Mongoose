mob/player

	desc = "A human bean"
	icon_state = "player"



	Login()

		gender = input("Select a gender for your character.","Your Gender",gender) in list("male","female","neuter")

		var/tone = rand(0,128)
		src.icon *= rgb(255-tone,220-tone,177-tone)

		src.client.screen += new/obj/buttons/holding
		src.client.screen += new/obj/buttons/second
		src.client.screen += new/obj/buttons/drop
		src.client.screen += new/obj/buttons/clothes
		//src.client.screen += new/obj/buttons/hat
		src.client.screen += new/obj/buttons/throwing

		var/obj/items/equipment/peasant/P = new(src.loc)
		P.equip(E_SLOT_UNIFORM)

		loc = locate(/turf/floors/spawn)

		overlayset()

		if(prob(25) == 1)
			src.languages.Add("Gutterspeak")
		if(prob(50) == 1)
			src.languages.Add("Chinese")
		if(prob(1) == 1)
			src.languages.Add("Boffin")
		if(prob(2) == 1)
			src.languages.Add("Russian")

		DNA = rand(10000,99999)

		var/names/N = new(gender)
		name = N.name






	examined()
		if(!(src.holding == null))
			usr << "<SPAN CLASS=examine> \icon[src.holding] A [src.holding] is in their hand </SPAN>"
		if(!(src.clothes == null))
			usr << "<SPAN CLASS=examine> \icon[src.clothes] They are wearing [src.clothes] </SPAN>"

	verb/say(msg as text)
		for(var/mob/listener in hearers())
			if(src.language in listener.languages)
				listener << "[src.name] says \"[msg]\" "
			else
				listener << "[src.name] says something in [src.language]"

	verb/lay()

		if(binaryFlagCheck(src.conditions,MOB_PARALYZED) == 1)
			return

		if(binaryFlagCheck(src.conditions,MOB_LAYING) == 1)
			getup()

		else if(binaryFlagCheck(src.conditions,MOB_LAYING) == 0)
			laydown()

	verb/change_language()

		if(src.languages.len > 1)
			src.language = input("What language are you speaking?","Your language") as anything in src.languages
			usr << "<SPAN CLASS=examine> You switch to speaking [src.language] </SPAN>"
		else
			usr << "<SPAN CLASS=examine> You only speak one language! </SPAN>"

	clicked()
		var/obj/items/H = usr.holding
		for(var/I in H.properties)
			if(I == "edible")
				if(usr == src)
					eat(H)




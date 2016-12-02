/mob/player

	name = "Unkown"
	desc = "A human bean"

	icon_state = "player"

	Login()
		name = input("What is your name?") as text

		skin = new(usr.icon)
		skin.color = input("What color") as color

		src.client.screen += new/obj/buttons/holding
		src.client.screen += new/obj/buttons/second
		src.client.screen += new/obj/buttons/drop
		src.client.screen += new/obj/buttons/clothes
		src.client.screen += new/obj/buttons/hat

		loc = locate(/turf/floors/spawn)

		overlayset()

	examined()
		usr << "<SPAN CLASS=examine> A [usr.holding] is in /his hand </SPAN>"


	verb
		say(msg as text)
			view() << "[src.name] says \"[msg]\" "


/mob/player

	name = "Unkown"
	desc = "A human bean"

	icon_state = "player"

	Login()
		name = input("What is your name?") as text

		src.client.screen += new/obj/buttons/holding
		src.client.screen += new/obj/buttons/drop

		loc = locate(/turf/floors/spawn)


	verb
		say(msg as text)
			view() << "[src.name] says \"[msg]\" "

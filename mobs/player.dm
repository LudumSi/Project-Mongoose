/mob/player

	icon_state = "player"

	var/holding = null

	Login()
		name = input("What is your name?") as text
		loc = locate(/turf/floors/spawn)

	verb
		say(msg as text)
			view() << "[src.name] says \"[msg]\" "


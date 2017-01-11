/obj/items/paper

	icon_state = "paper"
	name = "Paper"
	desc = "A simple piece of paper"

	var/message
	var/written = 0

	clicked()
		if(istype(usr.holding,/obj/items/writing))
			if(written == 0)
				var/obj/items/writing/H = usr.holding
				var/msg = input("What do you write?") as message
				//NOTE: style system does not work, explore html instead
				message = "<SPAN class=[H.style]>[msg]</SPAN>"
				written = 1
			else
				usr << "The paper has already been written on"

	inv_clicked()
		if(written == 1)
			usr << browse("[message]","window=paper")
		else
			usr << "There is nothing on the paper"


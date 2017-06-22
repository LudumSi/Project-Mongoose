obj/items/locks

	name = "lock"
	desc = "To prevent people stealing your shit. Alternatively, to prevent you from stealing people's shit."

	icon_state = "lock"

	proc/lockCheck()
	var/locked = 0

	examined()
		if(locked == 1)
			usr << "<SPAN class = examine> It is locked </SPAN>"
		else if(locked == 0)
			usr << "<SPAN class = examine> It is unlocked </SPAN>"

	code

		name = "code lock"

		var/keycode = "password"

		lockCheck()
			var/code_attempt = input("Enter the password") as text
			if(code_attempt == keycode)
				return 1
			else
				return 0

		inv_clicked()
			if(usr.holding == src)
				if(locked == 0)
					switch(alert("Lock or change code?",,"Lock","Change code"))
						if("Change code")
							src.keycode = input("What are you changing the code to?") as text
						if("Lock")
							locked = 1
							usr << "<SPAN class = examine>You lock the lock</SPAN>"
				else
					var/L = lockCheck()
					if(L)
						locked = 0
						usr << "<SPAN class = examine>You unlock the lock</SPAN>"
	key
		name = "key lock"

		var/keyNum = 0
		lockCheck()
			if(istype(usr.holding,/obj/items/key))
				var/obj/items/key/K = usr.holding
				if(K.keyNum == src.keyNum)
					return 1
				else
					return 0

		inv_clicked()
			if(usr.holding == src)
				if(locked == 0)
					switch(alert("Are you sure?",,"Yes","No"))
						if("Yes")
							locked = 1
							usr << "<SPAN class = examine>You lock the lock</SPAN>"
						else
							return
			else if(istype(usr.holding,/obj/items/key/blank))
				if(locked == 0)
					var/obj/items/key/blank/B = usr.holding
					usr << "<SPAN class = examine>You fit the key blank to the lock</SPAN>"
					B.fitted(src.keyNum)
			else if(istype(usr.holding,/obj/items/key))
				if(locked == 1)
					var/L = lockCheck()
					if(L == 1)
						locked = 0
						usr << "<SPAN class = examine>You unlock the lock</SPAN>"


		random
			New()
				keyNum = rand(1000,9999) //Use less than 1000 for customs on map.

	dna
		name = "dna lock"

		var/list/users = new()

		lockCheck()
			if(usr.DNA in src.users)
				return 1
			else
				return 0

		inv_clicked()
			if(usr.holding == src)
				if(locked == 0)
					switch(alert("What are you doing?",,"Lock","Add DNA","Reset DNA"))
						if("Add DNA")
							src.users.Add(usr.DNA)
							usr << "<SPAN class = examine>You feel a small prick as your DNA is sampled</SPAN>"
						if("Lock")
							locked = 1
							usr << "<SPAN class = examine>You lock the lock</SPAN>"
						if("Reset DNA")
							users = new()
							usr << "<SPAN class = examine>A red light blips as you delete the lock's database</SPAN>"
				else
					var/L = lockCheck()
					if(L)
						locked = 0
						usr << "<SPAN class = examine>You unlock the lock</SPAN>"
obj/items/key

	name = "key"
	desc = "It opens the appropriate lock"
	icon_state = "key"

	var/keyNum = 0

	inv_clicked()
		if(istype(usr.holding,/obj/items/writing/pen))
			src.name = input("What are you labeling the key?") as text

	//At some point add a key ring

	blank

		keyNum = null

		proc/fitted(num)
			var/obj/items/key/K = new(usr.loc)
			K.keyNum = num
			del src

		name = "blank key"
		desc = "A blank key, ready to be fitted to a lock"


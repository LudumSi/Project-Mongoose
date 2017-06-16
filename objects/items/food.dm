obj/items/food

	var/foodValue = 0
	proc/eaten()
	var/bites = 0

	proc/doneEating()
		destroyme()

	properties = list("edible")
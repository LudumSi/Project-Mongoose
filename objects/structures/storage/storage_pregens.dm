obj/structures/storage/locker


	security
		name = "locker \[security]"
		New()
			contents.Add(new/obj/items/equipment/uniform/security)


	janitorial
		name = "locker \[janitorial]"
		New()
			contents.Add(new/obj/items/food/soap)

obj/structures/storage/crate

	beans
		name = "crate \[beans]"
		New()
			for(var/i=0,i<20,i++)
				contents.Add(new/obj/items/food/beans)





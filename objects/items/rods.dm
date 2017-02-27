/obj/items/stacks/rods

	name = "metal rods"
	desc = "A stack of metal rods"
	icon_state = "rods"
	stack_lim = 10


	Topic(href,href_list[])
		switch(href_list["action"])
			if("rods")
				if(!(/obj/structures in usr.loc))
					new/obj/structures/bars(usr.loc)
					stack_take(2)
				usr << browse(null,"window=rods")
				inv_clicked()
			else
				return ..()


	inv_clicked()
		var/rodHTML ={"
		<Title> Rods </Title>
		<Body>
		<p>You have [src.stack] bars left</p>
		<p><a href='?src=\ref[src];action=rods'>
		Create bars (2)
		</A></p>"}
		usr << browse(rodHTML,"window=rods")



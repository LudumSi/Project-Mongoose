names

	var/name

	var/list/NATO = list("Alpha",
		"Bravo",
		"Charlie",
		"Delta",
		"Echo",
		"Foxtrot",
		"Golf",
		"Hotel",
		"India",
		"Juliett",
		"Kilo",
		"Lima",
		"Mike",
		"November",
		"Oscar",
		"Papa",
		"Quebec",
		"Romeo",
		"Sierra",
		"Tango",
		"Uniform",
		"Victor",
		"Whisky",
		"X-ray",
		"Zulu")

	var/list/maleNormal = list("James",
		"John",
		"Robert",
		"Michael",
		"William",
		"David",
		"Richard",
		"Charles",
		"Joseph",
		"Thomas",
		"Christopher",
		"Daniel",
		"Paul",
		"Mark",
		"Donald",
		"George",
		"Kenneth",
		"Steven",
		"Edward",
		"Brian")

	var/list/femNormal = list("Mary",
	"Patricia",
	"Linda",
	"Barbara",
	"Elizebeth",
	"Jennifer",
	"Maria",
	"Susan",
	"Margaret",
	"Dorothy",
	"Lisa",
	"Nancy",
	"Karen",
	"Bettey",
	"Helen",
	"Sandra",
	"Donna",
	"Carol",
	"Ruth",
	"Sharon")

	New(gender)
		if(gender == "male")
			name = pick(maleNormal)
		else if(gender == "female")
			name = pick(femNormal)
		else if(gender == "neuter")
			name = pick(NATO)


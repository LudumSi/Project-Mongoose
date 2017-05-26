stat
	var/value = 0
	var/max_value = 0

	New(n)
		if(n)
			value = n
			max_value = n

	proc/Add(n)value = min(max(value + n, 0), max_value)
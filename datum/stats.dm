stat

	var/value
	var/max_value

	New(value,max)
		src.value = value
		src.max_value = max

	proc/Add(n)
		value = min(max(value + n, 0), max_value)








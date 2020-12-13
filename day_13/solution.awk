#!/usr/bin/awk -f

function gcd(a, b) { return b == 0 ? a : gcd(b, a % b) }
function lcm(a, b) { return a * b / gcd(a, b) }

BEGIN {
	getline earliest
	min = 0+earliest
	step = 1
	RS = ","
	NR = -1
}

!/x/ {
	wait = $0 - earliest % $0
	if (wait < min) {
		min = wait
		id = $0
	}
	while ((time+NR) % $0) time += step
	step = lcm($0, step)
}

END {
	print min * id
	print time
}

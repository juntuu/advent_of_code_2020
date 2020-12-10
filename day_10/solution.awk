#!/usr/bin/awk -f

$1 > max { max = $1 }
{ adapter[$1] }

END {
	max += 3
	adapter[max]
	arrange[0] = 1
	for (i = 1; i <= max; i++) {
		if (i in adapter) {
			diff[i - prev]++
			prev = i
			for (d = 1; d <= 3; d++)
				arrange[i] += arrange[i-d]
		}
	}
	print diff[1] * diff[3]
	print arrange[max]
}

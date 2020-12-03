#!/usr/bin/awk -f

function tree(dx, dy) {
	return NR % dy == 0 && line[(NR / dy * dx % width) + 1] == "#"
}

BEGIN {
	NR = -1  # zero indexed lines
	slopes[1, 1]
	slopes[5, 1]
	slopes[7, 1]
	slopes[1, 2]
}

{
	width = split($0, line, "")
	part1 += tree(3, 1)
	for (k in slopes) {
		split(k, slope, SUBSEP)
		hits[k] += tree(slope[1], slope[2])
	}
}

END {
	print part1
	part2 = part1
	for (k in hits) part2 *= hits[k]
	print part2
}

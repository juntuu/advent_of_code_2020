#!/usr/bin/awk -f

{ remaining = 2020 - $0 }

remaining in numbers { part1 = $0 * remaining }
remaining in two_sum { part2 = $0 * two_sum[remaining] }

part1 && part2 {
	print part1
	print part2
	exit
}

{
	for (k in numbers) two_sum[$0 + k] = $0 * k
	numbers[$0]
}

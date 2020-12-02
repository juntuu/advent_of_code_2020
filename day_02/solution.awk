#!/usr/bin/awk -f

function count(str, c) { return gsub(c, "", str) }

BEGIN { FS = "[-: ]+" }

{
	n = count($NF, $3)
	part1 += $1 <= n && n <= $2
	part2 += count(substr($NF, $1, 1) substr($NF, $2, 1), $3) == 1
}

END {
	print part1
	print part2
}

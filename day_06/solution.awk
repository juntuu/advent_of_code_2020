#!/usr/bin/awk -f

BEGIN {
	RS=""
	FS="\n"
}

{
	for (i = 1; i <= NF; i++) {
		for (j = split($i, line, ""); j; j--) {
			part1 += !(line[j] in ans)
			ans[line[j]]++
		}
	}
	for (k in ans) part2 += ans[k] == NF
	delete ans
}

END {
	print part1
	print part2
}

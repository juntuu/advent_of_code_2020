#!/usr/bin/awk -f

function count_bags(bag, bags, uniq, _seen, _count, _n, _a) {
	sub(/[0-9]+ /, "", bag)
	if (uniq && bag in _seen) return 0
	if (uniq) _seen[bag]
	for (_n = split(bags[bag], _a, RS); --_n > 0;)
		_count += _a[_n] * count_bags(_a[_n], bags, uniq, _seen, 1)
	return _count
}

!/no other/ {
	for (i = 5; i <= NF; i += 4) {
		bag = $(i+1) SUBSEP $(i+2)
		outer[bag] = 1 FS $1 SUBSEP $2 RS outer[bag]
		inner[$1,$2] = $i FS bag RS inner[$1,$2]
	}
}

END {
	golden = "shiny" SUBSEP "gold"
	print count_bags(golden, outer, "unique")
	print count_bags(golden, inner)
}

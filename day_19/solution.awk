#!/usr/bin/awk -f

function resolve(name, r, _k, _a) {
	_k = rule[r]
	rule[r] = name
	while (split(_k, _a, /[^0-9]+/) > 2)
		for (r in _a) gsub(" "_a[r]" ", " ("rule[_a[r]]") ", _k)
	gsub(/ /, "", _k)
	return _k
}

BEGIN { FS = ": " }

NF == 2 {
	gsub(/"/, "")
	rule[$1] = " "$2" "
	next
}

NF == 0 {
	A = resolve("A", 42)
	B = resolve("B", 31)
	C = resolve("C", 8)
	D = resolve("D", 11)
	r1 = r2 = resolve("X", 0)
	gsub(/C/, C, r1)
	gsub(/D/, D, r1)
	gsub(/A/, A, r1)
	gsub(/B/, B, r1)
	r1 = "^("r1")$"

	for (i = 0; i < 3; i++)  # limit found experimentally
		gsub(/D/, "(("A")("B")|("A")D("B"))", r2)
	gsub(/D/, "(("A")("B"))", r2)
	gsub(/C/, "("A")+", r2)
	r2 = "^("r2")$"
	next
}

$0 ~ r1 { match1++; next }
$0 ~ r2 { match2++ }

END {
	print match1
	print match1 + match2
}

#!/usr/bin/awk -f

function play(limit, _n) {
	for (;NR < limit; NR++) {
		_n = said[prev]
		said[prev] = NR
		prev = _n ? NR - _n : 0
	}
	return prev
}

BEGIN { RS = "," }

{ said[$1] = NR }

END {
	prev = said[NR]
	print play(2020)
	print play(3e7)
}

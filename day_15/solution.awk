#!/usr/bin/awk -f

function play(limit, _n) {
	for (;i < limit; i++) {
		_n = said[prev]
		said[prev] = i
		prev = _n ? i - _n : 0
	}
	return prev
}

BEGIN { FS = "," }

{
	for (i = 1; i < NF; i++) said[$i] = i
	prev = $NF
}

END {
	print play(2020)
	print play(3e7)
}

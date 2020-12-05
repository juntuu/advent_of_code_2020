#!/usr/bin/awk -f

function b_to_n(b, _n) {
	for (_n = 0; b ~ /^[01]/; b = substr(b, 2))
		_n = 2 * _n + substr(b, 1, 1)
	return _n
}

{
	gsub(/[FL]/, "0")
	gsub(/[BR]/, "1")
	seat = b_to_n($0)
	if (seat > max) max = seat
	taken[seat]
}

END {
	print max
	while (max in taken) max--
	print max
}

#!/usr/bin/awk -f

function next_seat(x, y, dx, dy) {
	while ((x+=dx, y+=dy) in floor && part);
	return x SUBSEP y
}

function adjacent_seats(pos, _k, _a, _dx, _dy, _res) {
	split(pos, _a, SUBSEP)
	for (_dx = -1; _dx < 2; _dx++) {
		for (_dy = -1; _dy < 2; _dy++) {
			if (_dx == 0 && _dy == 0) continue
			_k = next_seat(_a[1], _a[2], _dx, _dy)
			if (_k in seat) _res = _res " " _k
		}
	}
	sub(/^ +/, "", _res)
	return _res
}

function step(from, to, _a, _i, _n, _k) {
	for (_k in adjacent) {
		split(adjacent[_k], _a)
		_n = 0
		for (_i in _a) _n += from[_a[_i]]
		to[_k] = _n <= (3+part)*from[_k]
		if (to[_k] == from[_k]) delete adjacent[_k]
	}
	for (_k in adjacent) return 1
}

{
	width = split($0, line, "")
	for (i = 1; i <= width; i++)
		line[i] ~ /L/ ? ++seat[NR,i] : floor[NR,i]
}

END {
	for (part = 0; part < 2; part++) {
		for (k in seat)
			adjacent[k] = adjacent_seats(k)
		delete A
		step(seat, A)
		while (step(A, B) && step(B, A));
		n = 0
		for (k in A) n += A[k]
		print n
	}
}

#!/usr/bin/awk -f

function next_seat(x, y, dx, dy) {
	while ((x+=dx, y+=dy) in floor && part);
	return x SUBSEP y
}

function mark(grid, out, pos, _k, _a, _dx, _dy) {
	split(pos, _a, SUBSEP)
	for (_dx = -1; _dx < 2; _dx++) {
		for (_dy = -1; _dy < 2; _dy++) {
			if (_dx == 0 && _dy == 0) continue
			_k = next_seat(_a[1], _a[2], _dx, _dy)
			if (_k in grid) out[_k]++
		}
	}
}

function step(from, to, _k, _change) {
	delete to
	for (_k in from)
		from[_k] && mark(from, to, _k)
	for (_k in from) {
		to[_k] = to[_k] <= (3+part)*from[_k]
		_change += to[_k] != from[_k]
	}
	return _change
}

{
	width = split($0, line, "")
	for (i = 1; i <= width; i++)
		line[i] ~ /L/ ? ++seat[NR,i] : floor[NR,i]
}

END {
	for (part = 0; part < 2; part++) {
		step(seat, A)
		while (step(A, B) && step(B, A));
		n = 0
		for (k in A) n += A[k]
		print n
	}
}

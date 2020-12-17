#!/usr/bin/awk -f

function add(tally, dim, n, _k, _s, _d) {
	if (n < 1) return tally[_k]++
	for (_d = -1; _d < 2; _d++)
		add(tally, dim, n-1, (dim[n] + _d) _s _k, SUBSEP)
}

function step(grid, _k, _n, _a, _i) {
	for (_k in grid) {
		_i = split(_k, _a, SUBSEP)
		add(_n, _a, _i)
	}
	for (_k in _n) {
		if (_n[_k] != 3 + (_k in grid))
			delete grid[_k]
		_n[_k] == 3 && grid[_k]
	}
}

/#/ {
	n = split($0, line, "")
	for (i = 1; i <= n; i++) {
		if (line[i] ~ /#/) {
			grid[NR,i,0]
			grid[NR,i,0,0]
		}
	}
}

END {
	for (i = 0; i < 6; i++)
		step(grid)
	for (k in grid)
		count[split(k, _, SUBSEP)]++
	print count[3]
	print count[4]
}

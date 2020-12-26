#!/usr/bin/awk -f

function mod_pow(x, e, m, _n) {
	if (m == 1) return 0
	x %= m
	for (_n = 1; e > 0; e = int(e / 2)) {
		if (e % 2) _n = (_n * x) % m
		x = (x * x) % m
	}
	return _n
}

function ceil(n) { return int(n) + (int(n) < n) }

function discrete_log(g, h, m, _m, _e, _i, _table, _f) {
	_m = ceil(sqrt(m))
	_e = 1
	for (; _i < _m; _i++) {
		_table[_e] = _i
		_e = (_e * g) % m
	}
	_f = mod_pow(g, m-_m-1, m)
	for (_i = 0; _i < _m; _i++) {
		if (h in _table)
			return _i*_m + _table[h]
		h = (h * _f) % m
	}
}

{ N[NR] = $1 }
END {
	mod = 20201227
	loop_size = discrete_log(7, N[1], mod)
	print mod_pow(N[2], loop_size, mod)
}

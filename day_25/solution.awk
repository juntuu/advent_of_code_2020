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

!a { a = $1 }
a { b = $1 }

END {
	mod = 20201227
	other[a] = b
	other[b] = a
	for (n = 1; n != a && n != b; loop_size++)
		n = (n * 7) % mod
	print mod_pow(other[n], loop_size, mod)
}

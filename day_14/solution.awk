#!/usr/bin/awk -f

function b_to_n(b, _n) {
	for (_n = 0; b ~ /^[01]/; b = substr(b, 2))
		_n = 2 * _n + substr(b, 1, 1)
	return _n
}

function n_to_b(n, mask, _b, _i, _m) {
	_i = 1 + split(mask, _m, "")
	for (; --_i; n = int(n / 2))
		_b = (_m[_i] ~ /X/ ? n % 2 : _m[_i]) _b
	return _b
}

function write(mem, val, addr, _b) {
	while (addr ~ /F/) {
		_b = addr
		sub(/F/, 0, addr)
		sub(/F/, 1, _b)
		write(mem, val, _b)
	}
	mem[addr] = val
}

BEGIN { FS = "[\\[\\]= ]+" }

/mask/ {
	mask = addr_mask = $2
	gsub(/X/, "F", addr_mask)
	gsub(/0/, "X", addr_mask)
}

/mem/ {
	mem1[$2] = n_to_b($3, mask)
	write(mem2, $3, n_to_b($2, addr_mask))
}

END {
	for (i in mem1) sum1 += b_to_n(mem1[i])
	print sum1

	for (i in mem2) sum2 += mem2[i]
	print sum2
}

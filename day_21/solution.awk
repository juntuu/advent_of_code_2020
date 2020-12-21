#!/usr/bin/awk -f

function join(arr, _s, _k) {
	for (_k in arr) _s = _s " " _k
	sub("^ ", "", _s)
	return _s
}

function max(arr, _k, _max) {
	for (_k in arr) _k > _max && _max = _k
	return _max
}

function single(arr, _k) {
	for (_k in arr) if (arr[_k] !~ / /) return _k
}

function Set(s, out, _a) {
	delete out
	split(s, _a, / /)
	for (s in _a) out[_a[s]]++
}

function remove(a, b, _a, _b, _k) {
	Set(a, _a)
	Set(b, _b)
	for (_k in _b) delete _a[_k]
	return join(_a)
}

function intersection(a, b, _a, _k) {
	if (!a) return join(b)
	Set(a, _a)
	for (_k in _a) if (!(_k in b)) delete _a[_k]
	return join(_a)
}

BEGIN { FS = " .contains |, " }

{
	gsub(/\)/, "")
	Set($1, A)
	for (k in A) ingredients[k] += A[k]
	for (k=1; k++ < NF;) allergen[$k] = intersection(allergen[$k], A)
}

END {
	for (k in allergen) {
		Set(allergen[k], A)
		for (k in A) delete ingredients[k]
	}
	for (k in ingredients)
		part1 += ingredients[k]
	print part1

	while (i = single(allergen)) {
		resolved[i] = allergen[i]
		delete allergen[i]
		for (k in allergen)
			allergen[k] = remove(allergen[k], resolved[i])
	}

	while (k = max(resolved)) {
		part2 = resolved[k] "," part2
		delete resolved[k]
	}
	sub(/,$/, "", part2)
	print part2
}

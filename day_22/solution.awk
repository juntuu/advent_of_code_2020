#!/usr/bin/awk -f

function max(cards, _a, _k) {
	split(cards, _a)
	for (_k in _a) cards = _a[_k] > cards ? _a[_k] : cards
	return cards
}

function take(cards, n) {
	match(cards, "^( [0-9]+){"n"}")
	return substr(cards, 1, RLENGTH)
}

function score(cards, n, _score) {
	for (; n; sub(/ *[0-9]+/, "", cards))
		_score += n-- * cards
	return _score
}

function play(a, na, b, nb, rec, _seen, _win, _a, _b) {
	if (rec > 1 && max(a) > max(b))
		return 0
	while (na && nb) {
		if (rec && _seen[a, b]++)
			return 0
		_a = +a
		_b = +b
		sub(/ *[0-9]+/, "", a)
		sub(/ *[0-9]+/, "", b)
		na--
		nb--
		_win = _a < _b
		if (rec && na >= _a && nb >= _b)
			_win = play(take(a, _a), _a, take(b, _b), _b, 2)
		if (_win) {
			b = b " " _b " " _a
			nb += 2
		} else {
			a = a " " _a " " _b
			na += 2
		}
	}
	return rec > 1 ? _win : score(a b, na + nb)
}

BEGIN { RS = "" }

{ N = gsub(/Player .:.|\n/, " ") }
NR == 1 { A = $0; NA = N }
NR == 2 { B = $0; NB = N }

END {
	print play(A, NA, B, NB)
	print play(A, NA, B, NB, 1)
}

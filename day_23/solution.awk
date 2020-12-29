#!/usr/bin/awk -f

function set(cups, max, _i) {
	while (++_i < N)
		cups[initial[_i]] = initial[_i+1]
	cups[initial[N]] = initial[1]
	if (max > N) {
		cups[initial[N]] = N+1
		while (++_i < max)
			cups[_i] = _i+1
		cups[max] = initial[1]
	}
	return initial[1]
}

function run(cups, max, rounds, _c, _p1, _p2, _p3, _d) {
	for (_c = set(cups, max); rounds--; _c = cups[_c]) {
		_p1 = cups[_d = _c]
		_p2 = cups[_p1]
		_p3 = cups[_p2]
		do --_d || _d = max
		while (_d == _p1 || _d == _p2 || _d == _p3)
		cups[_c] = cups[_p3]
		cups[_p3] = cups[_d]
		cups[_d] = _p1
	}
}

function part_one(_i, _a) {
	$0 = run(_a, N, 100)
	for (_i=1; 1 != _i=_a[_i];)
		$0 = $0 _i
}

function part_two(_a) {
	run(_a, 1e6, 1e7)
	$0 = _a[1] * _a[_a[1]]
}

{ N = split($0, initial, "") }
!part_one()
!part_two()

#!/usr/bin/awk -f

function parse(_i, _x, _y, _z, _d) {
	while ($++_i) {
		split(dir[$_i], _d)
		_x += _d[1]
		_y += _d[2]
		_z += _d[3]
	}
	return _x " " _y " " _z
}

function step(tiles, _n, _k, _p, _d) {
	for (_k in tiles) {
		split(_k, _p)
		for (_k in dir) {
			split(dir[_k], _d)
			_n[_p[1]+_d[1],_p[2]+_d[2],_p[3]+_d[3]]++
		}
	}
	for (_k in tiles) {
		if (!_n[_k] || _n[_k] > 2)
			delete tiles[_k]
		delete _n[_k]
	}
	for (_k in _n) _n[_k] == 2 && tiles[_k] = 1
}

BEGIN {
	SUBSEP = FS
	dir["e"]  = "1 0 -1"
	dir["se"] = "0 1 -1"
	dir["sw"] = "-1 1 0"
	dir["w"]  = "-1 0 1"
	dir["nw"] = "0 -1 1"
	dir["ne"] = "1 -1 0"
}

{ gsub(/e|w/, "& ") }
{ k = parse($0) }
k in tile { delete tile[k]; next }
{ tile[k] = 1 }

END {
	for (k in tile) part1++
	print part1
	while (i++ < 100) step(tile)
	for (k in tile) part2++
	print part2
}

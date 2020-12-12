#!/usr/bin/awk -f

function abs(n) { return n < 0 ? -n : n }
function manhattan(x, y) { return abs(x) + abs(y) }

BEGIN {
	way_lat = 1
	way_lon = 10
	bearing = 0
	# east
	dir[0,"lat"] = 0
	dir[0,"lon"] = 1
	# south
	dir[1,"lat"] = -1
	dir[1,"lon"] = 0
	# west
	dir[2,"lat"] = 0
	dir[2,"lon"] = -1
	# north
	dir[3,"lat"] = 1
	dir[3,"lon"] = 0
}

{ sub(/^./, "& ") }

/N/ { lat1 += $2; way_lat += $2 }
/E/ { lon1 += $2; way_lon += $2 }
/S/ { lat1 -= $2; way_lat -= $2 }
/W/ { lon1 -= $2; way_lon -= $2 }

/F/ {
	lat1 += $2 * dir[bearing,"lat"]
	lon1 += $2 * dir[bearing,"lon"]
	lat2 += $2 * way_lat
	lon2 += $2 * way_lon
}

/L/ { $1 = "R"; $2 = 360 - $2 }
/R/ {
	turn = int($2 / 90) % 4
	bearing = (bearing + turn) % 4
	y = way_lat
	x = way_lon
	if (turn == 1) {
		way_lat = -x
		way_lon = y
	}
	if (turn == 2) {
		way_lat = -y
		way_lon = -x
	}
	if (turn == 3) {
		way_lat = x
		way_lon = -y
	}
}

END {
	print manhattan(lat1, lon1)
	print manhattan(lat2, lon2)
}

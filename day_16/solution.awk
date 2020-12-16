#!/usr/bin/awk -f

BEGIN { FS = ":| or |-" }

/your ticket/ {
	getline
	FS = ","
	fields = split($0, ticket)
	for (i = 1; i <= fields; i++)
		for (k in field) field_opt[k, i]
}

/ or / {
	for (i = $2; i <= $3; i++) { valid_range[i]; valid_field[$1,i] }
	for (i = $4; i <= $5; i++) { valid_range[i]; valid_field[$1,i] }
	field[$1]
}

/nearby tickets/,0 {
	err = 0
	for (i = 1; i <= NF; i++)
		err += $i * !($i in valid_range)
	error_rate += err
}

!err && /,/ {
	for (i = 1; i <= NF; i++) {
		for (k in field) {
			if (!((k, $i) in valid_field))
				delete field_opt[k, i]
		}
	}
}


END {
	print error_rate

	for (pos = 1; pos;) {
		pos = 0
		for (k in field) {
			n = 0
			for (i = 1; n < 2 && i <= fields; i++) {
				if ((k,i) in field_opt) {
					n++
					pos = i
				}
			}
			if (n == 1) {
				field_pos[k] = pos
				for (x in field) delete field_opt[x, pos]
				delete field[k]
			}
		}
	}

	departure_product = 1
	for (k in field_pos)
		k ~ /departure/ && departure_product *= ticket[field_pos[k]]

	print departure_product
}

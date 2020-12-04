#!/usr/bin/awk -f

BEGIN {
	RS = ""
	fields["byr"] = "^(19[2-9][0-9]|200[0-2])$"
	fields["iyr"] = "^20(1[0-9]|20)$"
	fields["eyr"] = "^20(2[0-9]|30)$"
	fields["hgt"] = "^(1([5-8][0-9]|9[0-3])cm|(59|6[0-9]|7[0-6])in)$"
	fields["hcl"] = "^#[0-9a-f]{6}$"
	fields["ecl"] = "^(amb|blu|brn|gry|grn|hzl|oth)$"
	fields["pid"] = "^[0-9]{9}$"
}

{
	for (k in fields) if ($0 !~ k ":") next
	part1++

	for (i = 1; i <= NF; i++) {
		split($i, field, ":")
		if (field[1] in fields && field[2] !~ fields[field[1]]) next
	}
	part2++
}

END {
	print part1
	print part2
}

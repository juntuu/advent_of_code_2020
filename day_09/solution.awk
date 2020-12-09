#!/usr/bin/awk -f

NR > 25 && !target {
	for (n in window) if (ok=($0 != n && ($0-n) in window)) break
	if (!ok) target = $0
}

{ num[NR] = $0 }
{ window[$0]++ }
NR > 25 && --window[num[NR-25]] < 1 { delete window[num[NR-25]] }

END {
	while (sum != target || end < start+1) {
		while (sum < target) sum += num[++end]
		while (sum > target) sum -= num[start++]
	}
	min = max = num[start]
	while (++start <= end) {
		num[start] < min && min = num[start]
		num[start] > max && max = num[start]
	}
	print target
	print min + max
}

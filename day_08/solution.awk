#!/usr/bin/awk -f

function run(pc, _op, _loop) {
	while (!_loop[++pc]++ && _op=code[pc]) {
		_op ~ /acc/ && acc += _op
		_op ~ /jmp/ && pc += _op-1
	}
	return pc == NR+1
}

function swap(k) {
	return sub(/nop/, "jmp", code[k]) || sub(/jmp/, "nop", code[k])
}

{ code[NR] = $2 $1 }
/nop|jmp/ { try[NR] }

END {
	run()
	print acc
	for (k in try) {
		if (swap(k) && run(acc=0)) break
		swap(k)
	}
	print acc
}

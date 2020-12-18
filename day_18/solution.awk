#!/usr/bin/awk -f

function bin_op(a, op, b) {
	return op == "*" ? a * b : a + b
}

function factor(ops, f) {
	if (!f) return eval(ops, 1)
	if ($++i != "!") return $i
	f = eval(ops, 0)
	i++
	return f
}

function eval(ops, prec, _a) {
	_a = factor(ops, prec)
	while ($(i+1)prec ~ ops)
		_a = bin_op(_a, $++i, factor(ops, prec))
	return _a
}


{
	gsub(/[)(]/, " ! ")
	part1 += eval("[+*]", i=0)
	part2 += eval("[+]|[*]0", i=0)
}

END {
	print part1
	print part2
}

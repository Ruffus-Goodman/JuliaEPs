function sayhi(name)
	println("Hi $name, it's nice to meet you!")
end

function f(x)
	x^2
end

function f2(x)
	for i = 1:x
		((x + 1 - i) > 0) ? ((x + 1 - i) *= x - i) : x
	end
end

A = [i + 3*j for j in 0:2, i in 1:3]
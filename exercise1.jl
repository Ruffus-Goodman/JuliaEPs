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


***********************************************
String to equation ###################

julia> using Roots

julia> f(x) = eval(Meta.parse("2 * $x + 1 - 17"))
f (generic function with 1 method)

julia> find_zero(f, 5)
8.0

OU

julia> using Symbolics

julia> equation = "2 * x + 1 = 17"
"2 * x + 1 = 17"

julia> @variables x
1-element Vector{Num}:
 x

julia> eqn = eval(Meta.parse(replace(equation, "=" => "~")))
1 + 2x ~ 17

julia> Symbolics.solve_for(eqn, x)
8.0
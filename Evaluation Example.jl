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
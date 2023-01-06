módulo(x) = x < 0 ? -x : x

function máxmodVec(V::Vector)
	s = size(V,1)
	máx = -Inf
	for i in 1:s
		máx < módulo(V[i]) && (máx = V[i])
	end
	return máx
end

normaInf(V::Vector) = máxmodVec(V)^-1 .* V

mod2Vec(V::Vector) = sqrt(sum(map(x->x^2,V)))

norma2(V::Vector) = mod2Vec(V)^-1 .* V

@doc "Tuple of Tuples" tupVec(V::Vector,i=1,s=lastindex(V)) = return (V[i], (i + 1 > s) ? -Inf : tupVec(V,i+1,s))
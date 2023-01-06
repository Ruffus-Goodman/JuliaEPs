function rand_hyper(x, p, n = 1)
	if x < p
		n += 1
		rand_hyper(rand()+x, p, n)
	else
		return (x, n)
	end
end
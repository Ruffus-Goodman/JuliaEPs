function exp_sup(pot::Number)
	exp_str = ""
	E = ["⁰", "¹", "²", "³", "⁴", "⁵", "⁶", "⁷", "⁸", "⁹"]
	pot_str = "$pot"
	for i in eachindex(pot_str)
		exp_str *= E[parse(Int,pot_str[i])+1]
	end
	return exp_str
end
@doc "Função que converte expoentes em sobrescrito não-computável" exp_sup

# Testando Primos
#########################

function isprime(x::BigInt)
	x < 1 && throw(DomainError(x, "argument must be an integer higher than 0"))
	r = 2
	(x > 2 && x % r == 0) ? (return false) : (r += 1)
	while r <= floor(sqrt(x))
		if (x % r < 1)
			return false
		else
			r += 2
		end
	end
	return true
end
@doc "Função que testa se um número é primo. Retorna Bool" isprime

isprime(x) = error("fodeu!")
isprime(x) = isprime(BigInt(floor(real(x))))

#########################
function promptprime()
	print("Escreva um número inteiro maior que zero e listarei os primos para você: ")
	user_input = readline(stdin)
	try
		user_input = parse(Complex{Float64}, user_input)
	catch
		println("$user_input não é um número inteiro válido")
		promptprime()
		return
	end
	if user_input > 0
		P = primelist(user_input)
		println("\nPrimos listados até $user_input e devolvidos em um Vetor.\n")
		return P
	else
		println("$user_input não é maior que zero\n")
		promptprime()
	end
end
@doc "Versão com interface para usuário da listagem de primos. Retorna Vetor P" promptprime

#########################

function primelist(x::BigInt)
	P = Number[1, 2, 3, 5, 7, 11, 13, 17, 19, 23]
	if x < 29
		for i in lastindex(P):-1:1 ((x > P[i]) && (return P[1:i])); end
	end
	for i in 29:2:x
		if isprime(i)
			push!(P, i)
		end
	end
	return P
end
@doc "função de listagem de primos. Devolve um vetor" primelist

primelist(x) = primelist(BigInt(floor(real(x))))

############# ------------ mexer

# Fatorando em primos
#########################
function promptfact()
	print("Escreva um número inteiro maior que zero para ser fatorado em primos: ")
	number = readline(stdin)
	try
		number = parse(Int, number)
	catch
		println("$number não é um número inteiro válido")
		promptfact()
		return
	end
	if number > 0
		fatorado = factlist(number)
		println("\n$number fatorado em $fatorado.\n")
		return fatorado
	else
		println("$number não é maior que zero\n")
		promptfact()
	end
end
@doc "versão com interface para usuário da fatoração de um número" promptfact

function factlist(number::Int; plist=false, math_exp=true)
	P = primelist(number)
	fatorado = ""
	for i in 2:lastindex(P)
		if number % P[i] == 0
			fatorado *= " * $(P[i])"
			pot = 1
			Int(number /= P[i])
			while number % P[i] == 0
				pot += 1
				Int(number /= P[i])
			end
			if math_exp && pot > 1
				fatorado *= "^$pot"
			elseif pot > 1
				fatorado *= "$(exp_sup(pot))"
			else
				fatorado
			end
		end
	end
	plist && println(P)
	return fatorado[4:end]
end
@doc "função de listagem de fatoração. Devolve uma string" factlist

#########################
factório(n) = throw(TypeError(n, Int, typeof(n)))

function factório(n::Int)
	n < 0 && throw(DomainError(n, "precisa ser maior que 0"))
	n < 2 ? n = 1 : n *= factório(n - 1)
end
@doc "fatorial ! de um número ex: 4! = 24, 6! = 720, etc" factório
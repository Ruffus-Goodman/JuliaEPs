function isprime(x::Int, P=Vector{Int}())
	x < 1 && throw(DomainError(x, "argument must be an integer higher than 0"))
	r = 2
	while r <= div(x,sqrt(x))
		if x % r < 1 
			return false
		else
			r += 1	
		end
	end
	return true
end
@doc "Função que testa se um número é primo. Retorna Bool" isprime

isprime(x) = throw(TypeError(x, Int, typeof(x)))

#########################
function promptprime()
	print("Escreva um número inteiro maior que zero e listarei os primos para você: ")
	number = readline(stdin)
	try
		number = parse(Int, number)
	catch
		println("$number não é um número inteiro válido")
		promptprime()
		return
	end
	if number > 0
		P = primelist(number)
		println("\nPrimos listados até $number e devolvidos em um Vetor.\n")
		return P
	else
		println("$number não é maior que zero\n")
		promptprime()
	end
end
@doc "Versão com interface para usuário da listagem de primos. Retorna Vetor P" promptprime

function primelist(number::Int)
	P = Vector{Int}()
	for i in 1:number
		if isprime(i)
			push!(P, i)
		end
	end
	return P
end
@doc "função de listagem de primos. Devolve um vetor" primelist

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

function factlist(number::Int; plist=false)
	P = primelist(number)
	fatorado = ""
	for i in 2:lastindex(P)
		if number % P[i] == 0
			fatorado *= "*$(P[i])"
			pot = 1
			Int(number /= P[i])
			while number % P[i] == 0
				pot += 1
				Int(number /= P[i])
			end
			pot > 1 ? fatorado *= "^$pot" : fatorado
		end
	end
	plist && println(P)
	return fatorado[2:end]
end
@doc "função de listagem de fatoração. Devolve uma string" factlist

#########################
factório(n) = throw(TypeError(n, Int, typeof(n)))

function factório(n::Int)
	n < 0 && throw(DomainError(n, "precisa ser maior que 0"))
	n < 2 ? n = 1 : n *= factório(n - 1)
end
@doc "fatorial ! de um número ex: 4! = 24, 6! = 720, etc" factório
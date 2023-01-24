cd(raw"C:\Users\G0_Ma5T3R\julia_scripts")

using Dates
using Pkg
using OhMyREPL
using Term

#########################

function SYSOUT(content::AbstractString; fname="Sysout.txt", mode="print", dir="standard")
	(dir == "standard") && (dir = raw"C:\Users\G0_Ma5T3R\julia_scripts\x"; dir = dir[1:end-1])
	if mode == "clear"
		file = open(dir * fname, "w")
		content = ""
	else
		file = open(dir * fname, "a")
	end
	try print(file, content)
	catch e
		error(e)
	finally
		close(file)
	end
end
@doc "Simple function to print on a file. Uses Strings. Custom fname and dir availables" SYSOUT

SYSOUT(content; fname="Sysout.txt", mode="print", dir="standard") = SYSOUT("$content"; fname, mode, dir)

"""
Macro of the function SYSOUT()
"""
macro SYSOUT(content::Expr)
	quote
		local tmp = join($(esc(content.args[begin:end])))
		SYSOUT("\n$tmp")
		println("$tmp")
		$(esc(content))	
	end
end

#########################

if parse(Int64,Dates.format(now(),"HH")) < 12 
	greet = "{(240,240,90)}Good morning, {/(240,240,90)}"
elseif parse(Int64,Dates.format(now(),"HH")) < 18
	greet = "{orange}Good afternoon, {/orange}"
else
	greet = "{(40,40,190)}Good evening, {/(40,40,190)}"
end

devname = "{bold}Ruffus Goodman!{/bold}"

feelings = "{red}I'm eager to learn with you!{/red}"

welcome = Panel(greet * devname / feelings ; fit=true, box=:DOUBLE, style="dim green", justify=:center)

welcome2 = Term.Spacer(3,25)

tprint(welcome2 * welcome; highlight = false)


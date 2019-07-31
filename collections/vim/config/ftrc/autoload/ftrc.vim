function Text()
	set wrap
	set linebreak
	set breakindent
	set spell

	set ruler
	set autoindent
	set smartindent

	set nonumber
	set norelativenumber

	no j gj
	no k gk
	no A g$a
	no I g0i
endfunction

function Code()
	set number
	set relativenumber

	set ruler
	set autoindent
	set smartindent

	set nowrap
	set nolinebreak
	set nobreakindent
	set nospell
endfunction


function ftrc#Detect()
	if (&ft == 'text' || &ft == 'markdown')
		execute Text()
	else
		execute Code()
	endif
endfunction

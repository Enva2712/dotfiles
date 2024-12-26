function ftrc#Detect()
	if (&ft == 'text' || &ft == 'markdown')
		set wrap lbr spell
	else
		set nowrap nolbr nospell
	endif
endfunction

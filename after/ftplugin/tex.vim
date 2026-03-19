function! ZathuraOpenPdf()
	execute "silent !zathura '" . expand("%:p:r") . ".pdf' &"
endfunction
	
nnoremap <A-p> :call ZathuraOpenPdf()<CR>
set tw=80

autocmd BufWritePost * silent! !latexmk -pdf %

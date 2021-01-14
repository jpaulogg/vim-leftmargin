" leftmargin.vim - https://github.com/jpaulogg/vim-leftmargin.git>

" Author:  João Paulo G. Garcia
" Licence: public domain
" Last Change: 2021/01/13  

" Add left margin for easy reading and writing prose

if exists('g:loaded_marginal')
	finish
endif
let g:loaded_marginal = 1

" highlight groups {{{1
augroup marginalColors
	autocmd ColorScheme * call s:Hi()
	autocmd OptionSet background,termguicolors call s:Hi()
augroup END

function s:Hi()
	hi MarginLineNr    ctermfg=bg  guifg=bg
	hi MarginCursorNr  ctermfg=bg  guifg=bg
	hi MarginFoldCol   ctermfg=bg  guifg=bg
	" hi MarginFolded    ctermfg=245   guifg=#928374
endfunction

let s:winhl ='LineNr:MarginLineNr,
	\FoldColumn:MarginFoldCol,
	\CursorLineNr:MarginCursorNr'
	"\...,Folded:MarginFolded' 

" options {{{1
let s:values = '[1,     s:nuw,  12,     s:winhl]'     " let s:values = '[..., 0]'
let s:opts   = '[&l:nu, &l:nuw, &l:fdc, &l:winhl]'    " let s:opts   = '[..., &g:laststatus]'
let s:backup =  [&nu,   &nuw,   &fdc,   &winhl]       " let s:backup =  [..., &laststatus]

functio s:Width()
	let l:width = (&columns - &textwidth) / 2
	if l:width < 32
		let s:nuw = l:width - 12
	else
		let s:nuw = 20
	endif
endfunction

" on/off/toggle {{{1
command! LeftMargin   call s:Enable()
command! NoMargin     call s:Disable()
command! ToggleMargin call s:Toggle()

function s:Enable()
	let b:margin_enabled = 1
	call s:Hi()
	call s:Width()
	if &buftype != '' && !exists('w:marginal_backup')
		exec 'let '.'w:marginal_backup = '.s:opts
	endif
	exec 'let '.s:opts.' = '.s:values
endfunction

function s:Disable()
	let b:margin_enabled = 0
	if &bt == '' || !exists('w:marginal_backup')
		exec 'let '.s:opts.' = s:backup'
	else
		exec 'let '.s:opts.' = w:marginal_backup'
	endif
endfunction

function s:Toggle()
	if get(b:, "margin_enabled")
		NoMargin
	else
		LeftMargin
	endif
endfunction

"}}} 

" vim: set fdm=marker :

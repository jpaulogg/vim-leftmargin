" leftmargin.vim - https://github.com/jpaulogg/vim-leftmargin.git>

" Licence: public domain
" Last Change: 2021/01/18

" Adds left margin for easier reading and writing prose

if exists('g:loaded_leftmargin')
	finish
endif
let g:loaded_leftmargin = 1

" highlight groups {{{1
augroup leftmarginColors
	autocmd ColorScheme * call s:Hi()
	autocmd OptionSet background,termguicolors call s:Hi()
augroup END

function s:Hi()
	hi leftmarginLineNr     ctermfg=bg  guifg=bg
	hi leftmarginCursorNr   ctermfg=bg  guifg=bg
	hi leftmarginFoldColumn ctermfg=bg  guifg=bg
	" hi leftmarginFolded    ctermfg=245 guifg=#928374
endfunction

let s:winhl ='LineNr:leftmarginLineNr,
	\FoldColumn:leftmarginFoldColumn,
	\CursorLineNr:leftmarginCursorNr'
	"\...,Folded:leftmarginFolded' 

" options {{{1
                                                      " hiding statusline:
let s:values = '[1,     s:nuw,  s:fdc,  s:winhl]'     " let s:values = '[..., 0]'
let s:opts   = '[&l:nu, &l:nuw, &l:fdc, &l:winhl]'    " let s:opts   = '[..., &g:laststatus]'
let s:backup =  [&nu,   &nuw,   &fdc,   &winhl]       " let s:backup =  [..., &laststatus]

functio s:Width()
	let l:width = (&columns - max([&textwidth, 80]) + 1) / 2
	let s:nuw = min([20, l:width])
	let s:fdc = min([l:width - s:nuw, 12])
endfunction

" on/off/toggle {{{1
command LeftMargin   call s:Enable()
command NoMargin     call s:Disable()
command ToggleMargin call s:Toggle()

" adjust margin when textwidth changes
augroup leftmarginWidth
	autocmd OptionSet textwidth if get(b:, 'margin_enabled') | LeftMargin
augroup END

function s:Enable()
	let b:margin_enabled = 1
	call s:Hi()
	call s:Width()
	if &buftype != '' && !exists('w:marginal_backup')    " help buffers and others
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

" vim: set noet fdm=marker:
" 'zR' to open and 'zM' to close all folds

" leftmargin.vim - https://github.com/jpaulogg/vim-leftmargin.git>
" Adds left margin for easier reading and writing prose

" Licence: public domain
" Last Change: 2021/01/18

" load once
if exists('g:loaded_leftmargin')
	finish
endif
let g:loaded_leftmargin = 1

" commands and mapping
map <unique> <leader>p <Cmd>call <SID>Toggle()<CR>

command LeftMargin call s:Enable()
command NoMargin   call s:Disable()

" autocmd
augroup leftmargin
	autocmd ColorScheme * call s:Highlight()
	autocmd OptionSet background,termguicolors call s:Highlight()
	autocmd OptionSet textwidth if get(w:, 'margin_enabled') | LeftMargin
augroup END

" highlight groups {{{1
function s:Highlight()
	hi leftmarginLineNr     ctermfg=bg  guifg=bg
	hi leftmarginCursorNr   ctermfg=bg  guifg=bg
	hi leftmarginFoldColumn ctermfg=bg  guifg=bg
	" hi leftmarginFolded    ctermfg=245 guifg=#928374
endfunction
call s:Highlight()

let s:winhl ='LineNr:leftmarginLineNr,
	\FoldColumn:leftmarginFoldColumn,
	\CursorLineNr:leftmarginCursorNr'
	"\...,Folded:leftmarginFolded' 

" options {{{1
                                               	" hiding statusline:
let s:values = '[1,   s:nuw, s:fdc, s:winhl]'  	"  = '[..., 0]'
let s:opts   = '[&nu, &nuw,  &fdc,  &winhl]'   	"  = '[..., &laststatus]'
let s:backup =  [&nu, &nuw,  &fdc,  &winhl]    	"  =  [..., &laststatus]

function s:Width()
	let l:width = (&columns - (empty(&textwidth) ? 78 : &textwidth) + 1) / 2
	let s:nuw = min([l:width, 20])         " prefer to use numberwidth than foldcolumn
	let s:fdc = min([l:width - s:nuw, 12])
endfunction

" enable, disable and toggle {{{1
function s:Enable()
	let w:margin_enabled = 1
	call s:Width()
	if &buftype != '' && !exists('w:marginal_backup')    " help buffers and others
		let w:marginal_backup = eval(s:opts)
	endif
	exec 'let '.s:opts.' = '.s:values
endfunction

function s:Disable()
	let w:margin_enabled = 0
	if &bt == '' || !exists('w:marginal_backup')
		exec 'let '.s:opts.' = s:backup'
	else
		exec 'let '.s:opts.' = w:marginal_backup'
	endif
endfunction

function s:Toggle()
	if &nuw == get(s:, 'nuw', 20)
		NoMargin
	else
		LeftMargin
	endif
endfunction

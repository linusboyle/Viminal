"
" juvenile.vim -- Show comments in grey if colour available, in defiance of
" Commander Pike, but nothing else, in deference to Commander Pike.
"
" <https://groups.google.com/forum/#!msg/golang-nuts/hJHCAaiL0so/kG3BHV6QFfIJ>
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
" License: Same as Vim itself
"
set background=dark
if v:version > 580
  highlight clear
  if exists('g:syntax_on')
    syntax reset
  endif
endif
let g:colors_name = 'juvenile'

if has('gui_running') || &t_Co >= 256
  highlight Normal  cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=#fcfcfc guibg=#030303
  highlight Comment cterm=NONE ctermfg=246  ctermbg=NONE gui=NONE guifg=#a0a0a0 guibg=NONE
  highlight NonText cterm=NONE ctermfg=246  ctermbg=NONE gui=NONE guifg=#a0a0a0 guibg=NONE
elseif &t_Co >= 8
  highlight Normal  cterm=NONE ctermfg=NONE ctermbg=NONE
  highlight Comment cterm=bold ctermfg=0    ctermbg=NONE
  highlight NonText cterm=bold ctermfg=0    ctermbg=NONE
else
  highlight Normal  cterm=NONE ctermfg=NONE ctermbg=NONE
  highlight Comment cterm=NONE ctermfg=NONE ctermbg=NONE
  highlight NonText cterm=NONE ctermfg=NONE ctermbg=NONE
endif
highlight Constant   cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight Identifier cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight Function   cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight Statement  cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight PreProc    cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight Title      cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight Type       cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight Special    cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight Delimiter  cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE

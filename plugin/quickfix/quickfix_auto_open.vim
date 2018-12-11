"
" quickfix_auto_open.vim: Always pop open the quickfix list or location list
" when they're changed. Dispassionately stolen from romainl's minivimrc.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
" License: Same as Vim itself
"
if exists('g:loaded_quickfix_auto_open') || &compatible
  finish
endif
if !exists('##QuickfixCmdPost') || !exists('##VimEnter')
  finish
endif
let g:loaded_quickfix_auto_open = 1

" Always pop open quickfix and location lists when changed
augroup quickfix_auto_open
  autocmd!
  autocmd QuickfixCmdPost [^l]* cwindow
  autocmd QuickfixCmdPost l* lwindow
  autocmd VimEnter * cwindow
augroup END

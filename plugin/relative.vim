"
" cursorline_current: If 'cursorline' is globally on, only enable it for the
" current window, and only when not in insert mode. Essentially, make
" 'cursorline' follow the actual normal-mode cursor as much as possible.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
" License: Same as Vim itself
"
" Linus Boyle changed this plugin to work for 'relativenumber', too
" So that relative number is only shown(if user defined it)in current window and not in 
" insert mode.

if exists('g:loaded_relative_current') || &compatible
  finish
endif

if !has('autocmd') || !has('windows') || v:version < 700
  finish
endif

let g:loaded_relative_current = 1

" Suspend 'relative' when a window is inactive or inserting
function! s:Suspend() abort
  if !&l:number
      return
  endif

  let w:relative_current = &l:relativenumber
  let &l:relativenumber = 0
endfunction

" Restore 'relative' when a window is active and non-insert
function! s:Restore() abort
  if !&l:number
      return
  endif

  let &l:relativenumber = get(w:, 'relative_current', &g:relativenumber)
  let w:relative_current = &l:relativenumber
endfunction

" Call s:Suspend() on all windows besides the current one
function! s:Load() abort

  " Cache current window index
  let l:wcur = winnr()

  " Iterate through all the windows and suspend all but the current one
  for l:wnum in range(1, winnr('$'))
    if l:wnum == l:wcur
      continue
    endif
    execute l:wnum . 'wincmd w'
    call s:Suspend()
  endfor

  " Return to the window in which we started
  execute l:wcur . 'wincmd w'

endfunction

" Set up hooks for toggling 'relative'
augroup relative_current
  autocmd!

  " Turn off 'relative' for other windows on load
  autocmd VimEnter * call s:Load()

  " Turn off 'relative' when leaving a window or losing focus. We call the
  " restore again on BufEnter to handle existent local buffer values for the
  " option overwriting the window value (Vim bug?)
  autocmd WinLeave,FocusLost * call s:Suspend()
  autocmd BufEnter,WinEnter,FocusGained * call s:Restore()

  " Turn off 'relative' when in insert mode
  " Check g:relative_current_insert, in case the user doesn't want it
  if get(g:, 'relative_current_insert', 1)
    autocmd InsertEnter * call s:Suspend()
    autocmd InsertLeave * call s:Restore()
  endif

augroup END

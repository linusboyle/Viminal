" big_file_options.vim: When opening a large file, take some measures to keep
" things loading quickly.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
" License: Same as Vim itself

if exists('g:loaded_big_file_options') || &compatible
  finish
endif

if !has('autocmd') || v:version < 600
  finish
endif

let g:loaded_big_file_options = 1

" Wrapper function to get the configured size limit, default to 10 MiB
function! s:Limit()
  let l:limit = exists('g:big_file_options_limit')
        \ ? g:big_file_options_limit
        \ : 10 * 1024 * 1024
  return l:limit
endfunction

" If we can use filesize to detect the big file early, we should
function! s:CheckPre(filename)

  " Try and get filesize, bail out if we can't
  let l:size = getfsize(a:filename)
  if l:size == -1
    return
  endif

  " Set the buffer's big flag to whether the file is verifiably outsize
  let b:big_file_options_big = l:size == -2 || l:size > s:Limit()

  " If we found it's a big file, call the early options set
  if b:big_file_options_big
    call s:SetPre()
  endif

endfunction

" If it's still indeterminate (stdin read?), try to check the buffer size
" itself
function! s:CheckPost()

  " The BufReadPre hook couldn't tell how big the file was; we'll examine it
  " now it's loaded into the buffer instead
  if !exists('b:big_file_options_big')

    " Test buffer size, bail if that doesn't work either
    let l:size = line2byte(line('$') + 1)
    if l:size == -1
      return
    endif

    " Flag the buffer's oversize status, if it's positive, we'll catch up and
    " run the early options set now
    let b:big_file_options_big = l:size > s:Limit()
    if b:big_file_options_big
      call s:SetPre()
    endif

  endif

  " If the buffer size is verifiably over the threshold, run the late options
  " set
  if b:big_file_options_big
    call s:SetPost()
  endif

endfunction

" These options can and should be set as early as possible
function! s:SetPre()

  " These are always set
  setlocal noswapfile
  setlocal undolevels=-1
  if has('persistent_undo')
    setlocal noundofile
  endif

  " Decide whether to set readonly options
  let l:readonly = exists('g:big_file_options_readonly')
        \ ? g:big_file_options_readonly
        \ : 1

  if l:readonly
    setlocal buftype=nowrite
    setlocal nomodifiable
    setlocal readonly
  endif

endfunction

" These options need to be set later, after the buffer has loaded
function! s:SetPost()

  " Force filetype off
  setlocal filetype=NONE

  " Syntax features
  if has('syntax')

    " Disable syntax highlighting if configured
    let l:syntax = exists('g:big_file_options_syntax')
          \ ? g:big_file_options_syntax
          \ : 0
    if !l:syntax
      setlocal syntax=OFF
    endif

    " Force maximum syntax columns down if configured
    if exists('+synmaxcol')
      let l:synmaxcol = exists('g:big_file_options_synmaxcol')
            \ ? g:big_file_options_synmaxcol
            \ : 256
      if exists('+synmaxcol') && &synmaxcol > l:synmaxcol
        let &l:synmaxcol = l:synmaxcol
      endif
    endif

  endif

  " Tell the user what we've done
  echomsg 'Big file detected, set appropriate options'

endfunction

" Define autocmd for calling to check filesize
augroup big_file_options
  autocmd!
  autocmd BufReadPre,StdinReadPre
        \ *
        \ call s:CheckPre(expand('<afile>'))
  autocmd BufReadPost,StdinReadPost
        \ *
        \ call s:CheckPost()
augroup end

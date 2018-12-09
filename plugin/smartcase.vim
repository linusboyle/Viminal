" smartcase.vim
" Copyright (c) 2018 Linus Boyle <linusboyle@gmail.com>
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

" enable smartcase when on commandline
if &compatible || exists('g:loaded_smartcase')
  finish
endif

let g:loaded_smartcase = 1

let s:smartcase_bak = &l:smartcase
let s:ignorecase_bak = &l:ignorecase

function! s:Suspend() abort
  let s:smartcase_bak = &l:smartcase
  let s:ignorecase_bak = &l:ignorecase
  let &l:smartcase = 1
  let &l:ignorecase = 1
endfunction

function! s:Restore() abort
  let &l:smartcase = s:smartcase_bak
  let &l:ignorecase = s:ignorecase_bak
  let s:smartcase_bak = &l:smartcase
  let s:ignorecase_bak = &l:ignorecase
endfunction

augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : call s:Suspend()
    autocmd CmdLineLeave : call s:Restore()
augroup END

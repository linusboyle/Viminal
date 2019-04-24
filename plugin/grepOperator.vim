" grepOperator.vim
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

if &compatible || exists('g:loaded_grepOperator')
  finish
endif

let g:loaded_grepOperator= 1

let s:grep_command = "Leaderf rg -e "

function! s:GrepOperator(type) abort
    let l:saved_unnamed_register = @@
    "let l:project_root = findRoot#Find_project_root()

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        "ignore multiline mode, just because it's not useful
        return
    endif

    "if empty(l:project_root)
         silent! execute s:grep_command . shellescape(@@) . " ."
    "else
        "silent! execute s:grep_command . shellescape(@@) . " " . l:project_root
    "endif

    let @@ = saved_unnamed_register
endfunction

nnoremap <silent> <plug>GrepOperatorNormal :<c-u>set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <silent>  <plug>GrepOperatorVisual :<c-u>call <SID>GrepOperator(visualmode())<cr>

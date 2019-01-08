" clang.vim
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

if exists("current_compiler")
  finish
endif

let g:current_compiler = "clang"

let s:cpo_save = &cpo
set cpo&vim

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=clang\ -fsyntax-only\ -Wall\ -Wextra\ -I./\ %:S
CompilerSet errorformat=
    \%-G%f:%s:,
    \%f:%l:%c:\ %trror:\ %m,
    \%f:%l:%c:\ %tarning:\ %m,
    \%I%f:%l:%c:\ note:\ %m,
    \%f:%l:%c:\ %m,
    \%f:%l:\ %trror:\ %m,
    \%f:%l:\ %tarning:\ %m,
    \%I%f:%l:\ note:\ %m,
    \%f:%l:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save

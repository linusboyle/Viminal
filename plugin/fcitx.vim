" fcitx.vim
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

if !executable('fcitx-remote')
    echom "fcitx.vim:fcitx-remote not found!"
    finish
endif

if &compatible || !has('autocmd') || get(g:, 'loaded_fcitx', 0)
    finish
endif

let g:loaded_fcitx = 1

function s:switchon() abort
    silent call system('fcitx-remote -o')
endfunction

function s:switchoff() abort
    silent call system('fcitx-remote -c')
endfunction

function! s:enable()
    augroup FCITX_AUTOCMD
        autocmd!
        autocmd InsertEnter * call <sid>switchon()
        autocmd InsertLeave * call <sid>switchoff()
    augroup END
endfunction

function! s:disable()
    try
        autocmd! FCITX_AUTOCMD
	catch /^Vim\%((\a\+)\)\=:E216/
        echom 'fcitx autoswitch is not enabled yet!'
    endtry
endfunction

command! -nargs=0 FcitxEnable call <SID>enable()
command! -nargs=0 FcitxDisable call <SID>disable()

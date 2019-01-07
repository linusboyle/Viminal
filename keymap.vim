" vim:set foldmethod=marker foldlevel=0:

" keymap.vim
" Copyright (c) 2019 Linus Boyle <linusboyle@gmail.com>
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

" Scripts--------------------{{{

" grep operator
nmap gs <plug>GrepOperatorNormal
vmap gs <plug>GrepOperatorVisual

" gtags cscope find operations
nmap <leader><leader>s <plug>gtagsfind_s
nmap <leader><leader>g <plug>gtagsfind_g
nmap <leader><leader>c <plug>gtagsfind_c
nmap <leader><leader>t <plug>gtagsfind_t
nmap <leader><leader>e <plug>gtagsfind_e
nmap <leader><leader>f <plug>gtagsfind_f
nmap <leader><leader>i <plug>gtagsfind_i
nmap <leader><leader>d <plug>gtagsfind_d
nmap <leader><leader>a <plug>gtagsfind_a

" syntax group
nmap <leader>s <plug>(showSynGroup)

"}}}

"Fundamental Mapping---------------{{{

nnoremap <Space> <PageDown>

" use j/k on virtual lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" and gj/gk for normal j/k
nnoremap gk k
nnoremap gj j

" window motions
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Go to home and end of line using H/L
noremap H ^
noremap L g_

" => 选中及操作改键
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
nnoremap Y y$

nnoremap <leader>q :q<CR>
nnoremap <leader><leader>q :q!<CR>
nnoremap <leader>w :w<CR>

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

noremap <c-z> <NOP>
noremap <c-s> <NOP>
" no help,thx
noremap <F1> <NOP>

" }}}

"Commandline Mapping--------------------{{{
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"}}}

"Search Utility-------------------------{{{

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

nnoremap <silent> <leader>/ :<C-U>nohlsearch<CR><C-L>
vnoremap <silent> <leader>/ :<C-U>nohlsearch<CR>gv<C-L>

"}}}

"Tab/buffer Related------------------{{{

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" }}}

"InsertMode Mapping-----------------------{{{
inoremap <C-U> <C-G>u<C-U>
"inoremap <c-l> <right>
"inoremap <c-h> <left>
" }}}

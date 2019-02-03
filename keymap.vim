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

" make it short to complete
inoremap <c-p> <c-x><c-p>
inoremap <c-n> <c-x><c-n>

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

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

nnoremap <leader>e :e *<C-z><S-Tab>
nnoremap <leader>f :find *<C-z><S-Tab>

vnoremap <leader>y "+y

" no help,thx
noremap <F1> <NOP>
noremap <C-z> <NOP>

" netrw
noremap <F5> :Vexplore<CR>

" }}}

"Commandline Mapping--------------------{{{
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"}}}

"Search-------------------------{{{

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

"}}}

"Tab/buffer Related------------------{{{

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

" Of course, this is just taken from official vim helpdoc
function! s:CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        if pumvisible()
            return "\<C-N>"
        else
            return "\<Tab>"
        endif
    endif
endfunction

inoremap <silent> <Tab> <C-R>=<sid>CleverTab()<CR>
" }}}

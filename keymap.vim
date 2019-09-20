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

nmap gw <plug>(InteractiveWindow)

" gtags cscope find operations
nmap <leader><leader>s <plug>gtagsfind_s
nmap <leader><leader>d <plug>gtagsfind_d
nmap <leader><leader>r <plug>gtagsfind_r

"nmap <leader><leader>t <plug>gtagsfind_t
"nmap <leader><leader>i <plug>gtagsfind_i
"nmap <leader><leader>e <plug>gtagsfind_e
"nmap <leader><leader>f <plug>gtagsfind_f
"nmap <leader><leader>a <plug>gtagsfind_a
"nmap <leader><leader>g <plug>gtagsfind_g

" syntax group
nmap <leader>s <plug>(showSynGroup)

"}}}

"Fundamental Mapping---------------{{{

" use j/k on virtual lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" and gj/gk for normal j/k
noremap gk k
noremap gj j

" window motions
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Go to home and end of line using H/L
noremap H ^
noremap L g_

" convenient indent operation 
vnoremap < <gv
vnoremap > >gv

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

"nnoremap <leader>e :e *<C-z><S-Tab>
"nnoremap <leader>f :find *<C-z><S-Tab>

vnoremap <leader>y "+y

" no help, thx
noremap <F1> <NOP>
noremap <C-z> <NOP>

" dictionary completion
inoremap <c-k> <c-x><c-k>

" }}}

"Commandline Mapping--------------------{{{
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-h> <t_kl>
cnoremap <C-l> <t_kr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"}}}

"Search-------------------------{{{

nnoremap / /\v
vnoremap / /\v

"}}}

"Tab/buffer-----------------{{{

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

noremap [t :tabprevious<cr>
noremap ]t :tabnext<cr>

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

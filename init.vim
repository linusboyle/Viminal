" init.vim
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

" All the config should be sourced only once
" I'm hoping the vimrc file can be easily re-sourced without
" much overhead

if get(g:, 'global_config_guard', 0)
    finish
endif

let g:global_config_guard=1

" add merlin plugin for ocaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" it's stupid...but useful
iabbrev mian main
iabbrev ture true
iabbrev fasle false
iabbrev tihs this
iabbrev @@ hzl17@mails.tsinghua.edu.cn

" Load third-party plugins

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jacoborus/tender.vim'
Plug 'crusoexia/vim-monokai'
Plug 'alpertuna/vim-header'
Plug 'unblevable/quick-scope'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'plasticboy/vim-markdown'
Plug 'octol/vim-cpp-enhanced-highlight', {'for' : 'cpp'}
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/LeaderF'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'
Plug 'Lokaltog/vim-easymotion'
Plug 'mhinz/vim-grepper'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'skywind3000/asyncrun.vim'
Plug 'sirver/ultisnips'
Plug 'whonore/Coqtail'
Plug 'neomake/neomake'
Plug 'wellle/targets.vim'

call plug#end()

" other configurations:
runtime tweaks.vim
runtime keymap.vim
runtime command.vim
runtime thirdparty.vim

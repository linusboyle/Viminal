" vim:set foldmethod=marker foldlevel=0:
"
" File              : .vimrc.bundles
" Author            : Linus Boyle <linusboyle@gmail.com>
" Date              : 01.09.2018
" Last Modified Date: 04.12.2018
" Last Modified By  : Linus Boyle <linusboyle@gmail.com>

" Plugins -------------{{{

call plug#begin('~/.vim/Plug')

"colorscheme ----------------{{{

Plug 'jacoborus/tender.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'dracula/vim', { 'as': 'dracula' }

"}}}

"util -----------------------{{{
Plug 'danro/rename.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
"Plug 'skywind3000/vim-preview'
Plug 'alpertuna/vim-header'

"visible mark
Plug 'kshenoy/vim-signature'

"async grep
Plug 'mhinz/vim-grepper',{'on':'Grepper'}

"}}}

"enhanced keybind
Plug 'tpope/vim-unimpaired'

"insert mode enhancement
Plug 'Raimondi/delimitMate'

"auto tag generation and management
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

"project management
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/LeaderF'
Plug 'tpope/vim-fugitive'

"moving enhancement
Plug 'Lokaltog/vim-easymotion'
Plug 'unblevable/quick-scope'

"complete
Plug 'Valloric/YouCompleteMe',{ 'on': []}
Plug 'rdnetto/YCM-Generator',{ 'on' : [],'branch':'stable'}
Plug 'Shougo/echodoc.vim'

Plug 'mbbill/undotree',{'on':'UndotreeToggle'}

"if &term ==# "xterm-256color" || has('gui_running')
    "Plug 'itchyny/lightline.vim'
"endif

"lang specific
Plug 'octol/vim-cpp-enhanced-highlight',{'for':'cpp'}
Plug 'plasticboy/vim-markdown',{'for':'markdown'}
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'

Plug 'sillybun/vim-repl', {'do': './install.sh'}
Plug 'mhinz/vim-startify'

Plug 'ryanoasis/vim-devicons'
Plug 'romgrk/winteract.vim'

call plug#end()

" monokai setting -------------------------{{{
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
"}}}

" ycm load autocommand -----{{{
augroup load_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('YouCompleteMe')
    autocmd InsertEnter * call plug#load('YCM-Generator')
augroup END
"}}}

"}}}

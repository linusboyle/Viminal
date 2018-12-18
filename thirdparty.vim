" vim:set foldmethod=marker foldlevel=0:
"
" File              : .vimrc.bundles
" Author            : Linus Boyle <linusboyle@gmail.com>
" Date              : 01.09.2018
" Last Modified Date: 04.12.2018
" Last Modified By  : Linus Boyle <linusboyle@gmail.com>

" Plugins -------------{{{

call plug#begin('~/.vim/Plug')

"util -----------------------{{{
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

"visible mark
Plug 'kshenoy/vim-signature'

"async grep
Plug 'mhinz/vim-grepper',{'on':'Grepper'}

"}}}

"enhanced keybind
Plug 'tpope/vim-unimpaired'

"insert mode enhancement
Plug 'Raimondi/delimitMate'

"project management
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/LeaderF'
Plug 'tpope/vim-fugitive'

"moving enhancement
Plug 'Lokaltog/vim-easymotion'

"complete
Plug 'Valloric/YouCompleteMe',{ 'on': []}
Plug 'rdnetto/YCM-Generator',{ 'on' : [],'branch':'stable'}
Plug 'Shougo/echodoc.vim'

Plug 'mbbill/undotree',{'on':'UndotreeToggle'}

Plug 'sillybun/vim-repl', {'do': './install.sh'}
Plug 'mhinz/vim-startify'

Plug 'ryanoasis/vim-devicons'

call plug#end()

" monokai setting -------------------------{{{
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
"}}}

"ycm load autocommand -----{{{
augroup load_ycm
    autocmd!
    autocmd InsertEnter *.cpp,*.c,*.h call plug#load('YouCompleteMe')
    autocmd InsertEnter *.cpp,*.c,*.h call plug#load('YCM-Generator')
augroup END
"}}}

"}}}

" vim:set foldmethod=marker foldlevel=0:

" .vimrc
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

" vim configuration file of Linus Boyle
" with reference to a great many others' files
" this configuration file is folded in the method "marker"

set nocp

" syntax highlighting
if has('syntax')
    syntax enable
    syntax on
endif

" ftplugin
if has('autocmd')
    filetype plugin indent on
    filetype on
endif

" diff methods
if has('diff') && v:version > 800
    set diffopt+=algorithm:patience
    set diffopt+=indent-heuristic
endif

" indent
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set shiftround

" virtual edit
if has('virtualedit')
    set virtualedit+=block
endif

"if has('linebreak')
    "set linebreak " break lines after words
"endif

"let ftplugins set it
set path-=/usr/include

" fold
if has('folding')
  set foldenable
  set foldlevelstart=99
  set foldmethod=indent
endif

" format options
set formatoptions+=m " 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B " 合并两行中文时，不在中间加空格
set formatoptions+=j " merge comments
" and do not add two spaces when joining
set nojoinspaces

" search
if &t_Co > 2 || has("gui_running")
    set hlsearch
endif
set incsearch

" gutter column
set number
set relativenumber 

" complete
if exists('+completeopt')
    set completeopt=menu,menuone
    set complete-=u
    set complete-=i
endif

" case setting
set noignorecase
set nosmartcase

" backspace
set backspace+=eol,start,indent

" sorry for you poor kids...
set shortmess=atI

" use bash aliases
let $BASH_ENV = "~/.bash_aliases"

" timeout
set timeoutlen=300

" pop prompt on failed operation
set confirm

" history storage
set history=2000

" program used when running :grep
if filereadable('/usr/bin/ag')
    set grepprg=ag\ --vimgrep
endif

" autoload the file if it is edited 
set autoread

" backup/swap/undo
set nobackup
if has("persistent_undo")
    let s:undo_dir = expand("~/.cache/undodir")

    if !isdirectory(s:undo_dir)
        silent! call mkdir(s:undo_dir, 'p')
    endif

    set undodir=~/.cache/undodir
    set undofile
endif

" mouse settings
set mouse=a
set mousehide

" terminal setting
set title
set novisualbell " remove error bell
set noerrorbells
set t_vb=
set ttyfast

" For regular expressions turn magic on
set magic

" cursor display
set nocursorcolumn
set nocursorline

set noshowmode " don't show mode
set display=lastline
" Allow buffers to have changes without being displayed
set hidden

" 在状态栏显示正在输入的命令
if has('cmdline_info')
    set showcmd
    set noruler " and do not show the ruler!
endif

" don't jump!
set noshowmatch

" wildmenu settings
set wildmenu
set wildmode=full
set wildcharm=<C-z>

" encodings
"
" Use UTF-8 if we can and env LANG didn't tell us not to
if has('multi_byte') && !exists('$LANG') && &encoding ==# 'latin1'
  set encoding=utf-8
endif

set fileencodings=utf-8,ucs-bom,gb18030,big5,latin1
set helplang=cn
set termencoding=utf-8

" colorscheme and gui setting
if has('gui_running')
    set guifont=Source\ Code\ Pro\ SemiBold\ 12
    set guioptions-=T
    set guioptions-=e
    set guioptions-=r
    set guioptions-=m
    set guioptions-=L
    colorscheme monokai
endif

" statusline/tabline
set laststatus=2
set statusline=%#Directory#
set statusline+=%f\ %r%m
set statusline+=%#MoreMsg#
set statusline+=\ %B
"right aligned
set statusline+=%#ModeMsg#
set statusline+=%=%l:%c\ %p%%\ %y
"set showtabline=2

set tabline=%!MyTabLine()

function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
        let s .= '%#Directory#'
    else
        let s .= '%#ModeMsg#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    " let s .= '%#TabLineFill#%T'

    return s
endfunction

function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction

" cscope interface
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-,g-,f-
"set cscopeprg=gtags-cscope
set cscopetag

" thesaurus
set thesaurus+=$HOME/.vim/thesaurus/mthesaur.txt

" dictionary
set dictionary+=$HOME/.vim/dictionary/english.txt 
    
let g:todo_pattern = '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|BUG\|HACK\)'
let g:debug_pattern = '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)'

runtime init.vim

nohlsearch

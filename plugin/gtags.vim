" /home/linusboyle/.vim/plugin/gtags.vim
" Copyright (c) 2019 Zhilei Han <linusboyle@gmail.com>
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

" I have turned to Leaderf for better gtags support
noremap <silent> <plug>gtagsfind_s :<c-u>Leaderf gtags -s <C-R><C-W><cr>
noremap <silent> <plug>gtagsfind_r :<c-u>Leaderf gtags -r <C-R><C-W><cr>
noremap <silent> <plug>gtagsfind_d :<c-u>Leaderf gtags -d <C-R><C-W><cr>

"command! -nargs=+ Gfind call gtags#find(<f-args>)
"noremap <silent> <plug>gtagsfind_s :<c-u>Gfind s <C-R><C-W><cr>
"noremap <silent> <plug>gtagsfind_g :<c-u>Gfind g <C-R><C-W><cr>
"noremap <silent> <plug>gtagsfind_c :<c-u>Gfind c <C-R><C-W><cr>
"noremap <silent> <plug>gtagsfind_d :<c-u>Gfind d <C-R><C-W><cr>
"noremap <silent> <plug>gtagsfind_t :<c-u>Gfind t <C-R><C-W><cr>
"noremap <silent> <plug>gtagsfind_e :<c-u>Gfind e <C-R><C-W><cr>
"noremap <silent> <plug>gtagsfind_f :<c-u>Gfind f <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <plug>gtagsfind_i :<c-u>Gfind i <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <plug>gtagsfind_a :<c-u>Gfind a <C-R><C-W><cr>

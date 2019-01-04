" gtags.vim
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

if &compatible || !has('cscope') || exists('g:loaded_gtags')
    finish
endif

let g:loaded_gtags = 1

let s:project_root = ''

function! s:switchdb(path) abort
    silent! cscope kill -1 "remove all
    let l:tag = fnamemodify(a:path, ':p') . '.git/GTAGS'
    let $GTAGSDBPATH = fnamemodify(a:path, ':p') . '.git'
    let $GTAGSROOT = a:path
    execute 'cs add ' . fnameescape(l:tag)

    let s:project_root = a:path
endfunction

function! s:updatedb() abort
    let l:root = findRoot#Find_project_root()

    if empty(l:root)
        echo "You are not editing a project :<"
        return 0
    endif

    if l:root !=# s:project_root
        if isdirectory(fnameescape(l:root) . '.git') 
            if filereadable(fnameescape(l:root) . '.git/GTAGS')
                call s:switchdb(fnameescape(l:root))
            else 
                echo "GTAGS not readable yet! Forget to generate it?"
                return 0
            endif
        else
            echo "seems not to be a git repo :<"
            return 0
        endif
    endif

    if empty(s:project_root) 
        echo "Cscope connection cannot be established :<"
        return 0
    endif

    return 1
endfunction

function! gtags#find(what, ...) abort

    if !s:updatedb()
        return
    endif

	let keyword = (a:0 > 0)? a:1 : ''
    let text = ''
    if a:what == '0' || a:what == 's'
        let text = 'symbol "'.keyword.'"'
    elseif a:what == '1' || a:what == 'g'
        let text = 'definition of "'.keyword.'"'
    elseif a:what == '2' || a:what == 'd'
        let text = 'functions called by "'.keyword.'"' 
    elseif a:what == '3' || a:what == 'c' 
        let text = 'functions calling "'.keyword.'"' 
    elseif a:what == '4' || a:what == 't' 
        let text = 'string "'.keyword.'"' 
    elseif a:what == '6' || a:what == 'e'
        let text = 'egrep "'.keyword.'"'
    elseif a:what == '7' || a:what == 'f'
        let text = 'file "'.keyword.'"' 
    elseif a:what == '8' || a:what == 'i'
        let text = 'files including "'.keyword.'"'
    elseif a:what == '9' || a:what == 'a'
        let text = 'assigned "'.keyword.'"'
    else
        echo "argument error!"
        return
    endif

	let text = "[cscope ".a:what.": ".text."]"
	call setqflist([], ' ', {'nr':'$','title':text})

    let tmpcsfix=&cscopequickfix
    set cscopequickfix=s+,c+,d+,i+,t+,e+,a+,g+,f+

    let tmpprg=&cscopeprg
    set cscopeprg=gtags-cscope

    try
	    exec 'cs find '.a:what.' '.fnameescape(keyword)
        "exec 'resize' min([ 6, max([ 1, len(getqflist()) ]) ])
	catch /^Vim\%((\a\+)\)\=:E259/
        echo "sorry, not found :<"
    endtry

    let &cscopequickfix=tmpcsfix
    let &cscopeprg=tmpprg

	redrawstatus
endfunction

function! s:wordstart()
  let l:line = getline('.')
  let l:start = col('.') - 1
  while l:start > 0 && l:line[l:start - 1] =~# '\a'
    let l:start -= 1
  endwhile
  return l:start
endfunction

function! gtags#complete(findstart, base)
  if a:findstart == 1
    return s:wordstart()
  else
    if !s:updatedb()
        return []
    endif

    return split(system('global -c ' . a:base), '\n')
  endif
endfunction


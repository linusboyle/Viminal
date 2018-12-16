" File: windows.vim
" Author: romgrk
" Exec: !::exe [source %]
"
" Modified by Linus Boyle on 2018-12-14

let s:winmode  = {}
let s:winmode.persistent = {}
let s:winmode.register = [ 0, 0 ]

let s:winmode.options = {
\ 'start': '',
\ 'stop':  '',
\ 'after': '',
\ }

let s:winmode.keys    = ''
let s:winmode.count   = ''
let s:winmode.submode = 'normal'

let s:winmap   = {}
let s:winmap.normal = {
\ "h": "normal! \<C-w><" , "=": "normal! \<C-w>=" ,
\ "j": "normal! \<C-w>-" , "f": "normal! \<C-w>_" ,
\ "k": "normal! \<C-w>+" , "F": "normal! \<C-w>|" ,
\ "l": "normal! \<C-w>>" , "o": "normal! \<C-w>o" ,
\
\ "|": "exe s:winmode.count.'wincmd |'",
\ "\\": "exe s:winmode.count.'wincmd _'",
\ "&": "normal! :\<C-r>=&tw\<CR>wincmd |\<CR>" ,
\
\ "\<A-h>": "normal! \<C-w>h" ,  "H": "normal! \<C-w>H" ,
\ "\<A-j>": "normal! \<C-w>j" ,  "J": "normal! \<C-w>J" ,
\ "\<A-k>": "normal! \<C-w>k" ,  "K": "normal! \<C-w>K" ,
\ "\<A-l>": "normal! \<C-w>l" ,  "L": "normal! \<C-w>L" ,
\
\ "x": "normal! \<C-w>c" , "n": "normal! :bn\<CR>" ,
\ "c": "normal! \<C-w>c" , "N": "normal! :bp\<CR>" ,
\ "s": "normal! \<C-w>s" , "\<TAB>": "normal! :bn\<CR>" ,
\ "v": "normal! \<C-w>v" , "\<S-TAB>": "normal! :bp\<CR>" ,
\ "d": "bdelete" ,
\
\ "w": "normal! \<C-w>w" , "\<A-w>": "normal! \<C-w>p" ,
\ "W": "normal! \<C-w>W" ,
\ "q": "normal! :copen\<CR>" ,
\ ";": "terminal" ,
\
\ "y": "call s:winmode.yank()",
\ "p": "call s:winmode.paste()",
\ "g": "call s:winmode.paste()",
\
\ "m": "let s:winmode.submode='move'" ,
\ ":": "let s:winmode.submode='set'" ,
\ "t": "let s:winmode.submode='tab'" ,
\
\ "\<ESC>": "let exitwin=1" ,
\ "\<CR>": "let exitwin=1" ,
\}

let s:winmap.move = {
\ "h": "normal! \<C-w>H" ,
\ "j": "normal! \<C-w>J" ,
\ "k": "normal! \<C-w>K" ,
\ "l": "normal! \<C-w>L" ,
\ "x": "normal! \<C-w>x" ,
\ "r": "normal! \<C-w>r" ,
\ "\<ESC>": "\" NOP" ,
\ }

let s:winmap.set = {
\ "w": "exe s:winmode.count.'wincmd |'",
\ "h": "exe s:winmode.count.'wincmd _'",
\ "W": "wincmd |",
\ "H": "wincmd _",
\ "\<ESC>": "let resetmode=1" ,
\ }

let s:winmode.persistent['tab'] = 1
let s:winmap.tab = {
\ ":": "exe ' ' . _#Input('exe:', 'tab ')" ,
\ ";": "tab terminal" ,
\ "o": "tab sview %" ,
\ "e": "tabedit %" ,
\ "x": "tabclose" ,
\ "d": "tabclose" ,
\ "c": "tabclose" ,
\ "\<A-,>": "bprevious" ,
\ "\<A-.>": "bnext" ,
\ "\<A-k>": "tabprevious" ,
\ "\<A-j>": "tabnext" ,
\ "[": "tabprevious" ,
\ "]": "tabnext" ,
\ "n": "tabedit %" ,
\ "<": "tabm -1" ,
\ ">": "tabm +1" ,
\
\ "w": "let s:winmode.submode='normal'" ,
\ "\<ESC>": "let exitwin=1" ,
\ }

let s:winmap.escape = ["\<ESC>", "q"]

function! window#InteractiveWindow()
    let exitwin  = 0
    let s:winmode.submode = 'normal'

    call s:prompt("window-mode started")
    while !exitwin
        let resetmode = 0

        let mode = s:winmode.submode
        let char = s:getChar()
        let lhs = char

        if !exists('s:winmap[l:mode][l:lhs]')
            if char =~ '^\d$'
                let s:winmode.count .= char
                call s:prompt('')
                call s:echo(s:winmode.count, 'TextWarning')
            else
                if !get(s:winmode['persistent'], s:winmode.submode, 0)
                    let s:winmode.submode = 'normal'
                end
                call s:prompt('')
                call s:echo(lhs, 'TextInfo')
            end
            continue
        end

        let rhs = s:winmap[mode][lhs]

        if s:winmode.submode is 'move'
            let resetmode = 1 | en

        let wincount = s:winmode.count

        call s:echo('executing', 'TextWarning') | exe rhs

        if exitwin   | break                            | end
        if resetmode | let s:winmode.submode = 'normal' | end

        let s:winmode.count = ''
        let s:winmode.keys  = ''
        call s:prompt('')
    endwhile

    redraw
    call s:echo("Done")
endfunction 

" Yank window
function! s:winmode.yank() dict
    let self.register = [ bufnr('%'), winsaveview() ]
    call s:echo(
                \ printf('Yanked %s', string(self.register)),
                \ 'TextInfo')
endfunc

" Paste window
function! s:winmode.paste() dict
    if !exists('self.register')
        return
    endif

    let [ bufnr, winview ] = self.register
    if (bufnr && !empty(winview))
        exec 'buffer ' . bufnr
        call winrestview(winview)
    endif
endfunc

" Utils
fu! s:getChar()
    let char = getchar()
    if char =~ '^\d\+$'
        return nr2char(char) | else
        return char          | end
endfun

fu! s:prompt(m, ...)
    redraw | call s:echo("[".s:winmode.submode."]> ". a:m)
    if !empty(a:000)
        for msg in range(len(a:000))
            call call('run_hello', ['foo'] + a:000)
        endfor
    end
endfu

fu! s:echo (...)
    " (mess, hl, re)
    let len = len(a:000)
    if len==3 || (len==2 && type(a:2)==0)
        redraw
    end
    if len==3 || (len==2 && type(a:2)==1)
        exe 'echohl '.a:2
    else
        echohl TextSuccess | end
    echon a:1 | echohl None
endfu

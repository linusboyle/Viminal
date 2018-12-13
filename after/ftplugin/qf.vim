nnoremap <buffer> <silent> h :call quickfix#older()<cr>
nnoremap <buffer> <silent> l :call quickfix#newer()<cr>

let b:undo_ftplugin .= '|nunmap <buffer> h'
            \ . '|nunmap <buffer> l'

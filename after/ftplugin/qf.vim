nnoremap <buffer> <silent> h :call quickfix#older()<cr>
nnoremap <buffer> <silent> l :call quickfix#newer()<cr>
nnoremap <buffer> <silent> q :q<cr>

setlocal norelativenumber

let b:undo_ftplugin .= '|nunmap <buffer> h'
            \ . '|nunmap <buffer> l'
            \ . '|setlocal relativenumber<'

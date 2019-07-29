nmap <buffer> <c-j> :CoqNext<cr>
nmap <buffer> <c-k> :CoqUndo<cr>

let b:undo_ftplugin = 'nunmap <buffer> <c-j>'
            \ . '|nunmap <buffer> <c-k>'

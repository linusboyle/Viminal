setlocal omnifunc=gtags#complete
packadd YouCompleteMe

let b:delimitMate_matchpairs = "(:),[:],{:}"

let b:undo_ftplugin .= '|unlet b:delimitMate_matchpairs'
            \ . '|setlocal omnifunc<'

setlocal omnifunc=gtags#complete

let b:delimitMate_matchpairs = "(:),[:],{:}"

let b:undo_ftplugin .= '|unlet b:delimitMate_matchpairs'
            \ . '|setlocal omnifunc<'

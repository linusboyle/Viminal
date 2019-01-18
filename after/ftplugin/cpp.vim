setlocal omnifunc=gtags#complete
setlocal path+=/usr/include
setlocal path+=/usr/include/c++/8

let b:delimitMate_matchpairs = "(:),[:],{:}"

let b:undo_ftplugin .= '|unlet b:delimitMate_matchpairs'
            \ . '|setlocal omnifunc<'
            \ . '|setlocal path<'

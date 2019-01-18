setlocal omnifunc=gtags#complete
setlocal path+=/usr/include

let b:undo_ftplugin .= '|setlocal omnifunc<'
            \ . '|setlocal path<'

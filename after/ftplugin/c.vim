setlocal omnifunc=gtags#complete
packadd YouCompleteMe

let b:undo_ftplugin .= '|setlocal omnifunc<'

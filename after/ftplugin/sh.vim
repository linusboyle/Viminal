compiler bash
setlocal iskeyword=$,@,48-57,_,192-255

let b:undo_ftplugin .= '|setlocal iskeyword<'

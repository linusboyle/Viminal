onoremap <buffer> ih :<c-u>execute "normal! ?^#\\+\r:nohlsearch\r0vg_"<cr>

let b:undo_ftplugin .= '|ounmap <buffer> ih'

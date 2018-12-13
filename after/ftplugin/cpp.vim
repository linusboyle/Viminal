setlocal mps+=<:>
let b:delimitMate_matchpairs = "(:),[:],{:}"

let b:undo_ftplugin .= '|setlocal mps<'
            \ . '|unlet b:delimitMate_matchpairs'

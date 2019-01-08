if exists('g:current_compiler')
    finish
endif

let g:current_compiler = 'shellcheck'

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=shellcheck\ -s\ bash\ -f\ gcc\ --\ %:S
CompilerSet errorformat=%f:%l:%c:\ %m\ [SC%n]

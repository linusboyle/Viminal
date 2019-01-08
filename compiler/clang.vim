" Vim compiler file
" Compiler:             GNU C Compiler
" Previous Maintainer:  Nikolai Weibull <now@bitwi.se>
" Latest Revision:      2010-10-14
" 			added line suggested by Anton Lindqvist 2016 Mar 31

if exists("current_compiler")
  finish
endif

let g:current_compiler = "clang"

let s:cpo_save = &cpo
set cpo&vim

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=clang\ -fsyntax-only\ -Wall\ -Wextra\ -I./\ %:S
CompilerSet errorformat=
    \%-G%f:%s:,
    \%f:%l:%c:\ %trror:\ %m,
    \%f:%l:%c:\ %tarning:\ %m,
    \%I%f:%l:%c:\ note:\ %m,
    \%f:%l:%c:\ %m,
    \%f:%l:\ %trror:\ %m,
    \%f:%l:\ %tarning:\ %m,
    \%I%f:%l:\ note:\ %m,
    \%f:%l:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save

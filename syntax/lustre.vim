" Vim syntax file
" Language:	Lustre
" Adapte de pascal.vim de
" ----Maintainer:	Mario Eusebio <bio@dq.fct.unl.pt>

syn clear

syn case ignore

syn keyword lusPack	package model provides needs body end uses

syn keyword lusStatement		returns var let tel assert
" syn keyword lusLabel		      case goto
syn keyword lusConditional	   if else then

" syn keyword lusTodo contained	TODO

" String
" syn region  lusString	start=+'+  end=+'+

syn match  lusIdentifier		"\<[a-zA-Z_][a-zA-Z0-9_]*\>"

syn match  lusDelimiter		"[()]"

" syn match  lusMatrixDelimiter	"[][]"

"if you prefer you can highlight the range
"syn match  lusMatrixDelimiter	"[[0-9]\+\.\.[0-9]\+]"

" Les notations numeriques sont recuperees de c.vim
syn match lusNumber    "\<[0-9]\+\>"
"floating point number, with dot, optional exponent
syn match lusFloat     "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\>"
"floating point number, starting with a dot, optional exponent
syn match lusFloat     "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\>"
"floating point number, without dot, with exponent
syn match lusFloat     "\<[0-9]\+e[-+]\=[0-9]\+\>"


" If you don't like tabs
"syn match lusShowTab "\t"
"syn match lusShowTabc "\t"

" Les caracteres speciaux
syn match lusOperator "[#+/*=><^]"
syn match lusOperator ">="
syn match lusOperator ">="
syn match lusOperator "<>"


syn region lusComment	start="(\*"  end="\*)" contains=lusTodo
syn region lusComment	start="/\*"  end="\*/" contains=lusTodo

" Priorite des trucs qui commencent par -
syn match lusType "<<"
syn match lusType ">>"
syn match lusOperator "-"
syn match lusOperator "->"
syn match lusComment	"--.*" contains=lusTodo

" Les mots-cles
syn keyword lusConstant true false
syn keyword lusOperator	and or not xor
syn keyword lusOperator div mod
syn keyword lusOperator pre current when 
syn keyword lusType	bool int real map red fill
syn keyword lusFunction	node function type const
syn keyword lusStatement	extern unsafe

syn sync lines=250

if !exists("did_lus_syntax_inits")
  let did_lus_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later
  hi link lusStatement		Statement
  " hi link lusLabel			Label
  hi link lusConditional		Conditional
  hi link lusTodo			Todo
  " hi link lusString			String
  " hi link lusMatrixDelimiter		Identifier
  hi link lusConstant		Number
  hi link lusNumber			Number
  hi link lusFloat			Number
  " hi link lusByte			Number
  hi link lusOperator			Operator
  hi link lusFunction			Function
  hi link lusType			Type
  hi link lusComment			Comment
  hi link lusStatement		Statement

  hi link lusPack		Type

"optional highlighting
  hi link lusDelimiter		Identifier

  "hi link lusShowTab			Error
  "hi link lusShowTabc		Error

  "hi link lusIdentifier		Identifier
endif

let b:current_syntax = "lus"

" vim: ts=8

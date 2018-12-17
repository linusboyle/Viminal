function! s:SynStack()
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <Plug>(showSynGroup) :call <sid>SynStack()<cr> 

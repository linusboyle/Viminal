xnoremap <silent> an :<c-u>call textobj#aroundNumber()<cr>
onoremap <silent> an :<c-u>call textobj#aroundNumber()<cr>

xnoremap <silent> in :<c-u>call textobj#inNumber()<cr>
onoremap <silent> in :<c-u>call textobj#inNumber()<cr>

xnoremap <silent> ai :<c-u>call textobj#aroundIndentation()<cr>
onoremap <silent> ai :<c-u>call textobj#aroundIndentation()<cr>

xnoremap <silent> ii :<c-u>call textobj#inIndentation()<cr>
onoremap <silent> ii :<c-u>call textobj#inIndentation()<cr>

xnoremap <silent> id :<c-u> normal! G$Vgg0<cr>
onoremap <silent> id :<c-u> normal! GVgg<cr>

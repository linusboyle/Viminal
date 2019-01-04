" vim:set foldmethod=marker foldlevel=0:

" Plugin Setting-------------------------{{{

" NerdTree ------------------{{{
augroup nerdtree_cli
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

noremap <F7> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

"}}}

"easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f2)
noremap <leader><leader>w <Plug>(easymotion-w)
noremap <leader><leader>b <Plug>(easymotion-b)

"YCM-------------------------------{{{
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" 触发补全快捷键 
let g:ycm_key_list_select_completion = ['<TAB>'] 
let g:ycm_key_list_previous_completion = ['<c-p>'] 

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_server_log_level = 'info'
let g:ycm_complete_in_strings = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_collect_identifiers_from_tags_files = 0

let g:ycm_show_diagnostics_ui = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_enable_diagnostic_signs = 0

let g:ycm_error_symbol = '×'
let g:ycm_warning_symbol = '☯'

"white list
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "sh":1,
            \ "html":1
            \ }

"nnoremap <leader>s :YcmCompleter GetType<CR>
" kind of useful
"nnoremap <leader>f :YcmCompleter FixIt<CR>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp': ['re!\w{2}'],
            \ 'html': ['re!\w{2}','</'],
            \ }
"}}}

"undo tree
let g:undotree_WindowLayout = 3
let g:undotree_ShortIndicators = 1
let g:undotree_TreeNodeShape = '・'

nnoremap <F6> :UndotreeToggle<cr>

"Leaderf -------------------------------------{{{
let g:Lf_ShortcutF = '<c-p>'
"let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>

if(!has("gui_running"))
    execute "set <M-p>=\ep"
    execute "set <M-n>=\en"
    execute "set <M-m>=\em"
endif

noremap <m-p> :LeaderfFunction!<cr>
noremap <m-b> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>

"let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_StlSeparator = { 'left': '', 'right': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn','.hg','.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'one'
let g:Lf_PreviewResult = {'Function':0}
let g:Lf_Ctags= '/usr/bin/ctags' 

let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }
"}}}

"delimitmate
let g:delimitMate_expand_cr = 1

nmap gw <plug>(InteractiveWindow)

"header
let g:header_field_author = 'Linus Boyle'
let g:header_field_author_email = 'linusboyle@gmail.com'
let g:header_auto_add_header = 0

"echodoc
let g:echodoc#enable_at_startup = 1

"repl
nnoremap <leader>r :REPLToggle<Cr>
let g:sendtorepl_invoke_key = "<leader>o" 
let g:repl_position = 3
let g:repl_width = 50
let g:repl_program = {
            \	"python": "python3",
            \	"default": "bash",
            \   "javascript": "node",
            \   "cpp": "cling",
            \	}
let g:repl_input_symbols = {
            \   'python': ['>>>', '>>>>', 'ipdb>', 'pdb', '...'],
            \   'javascript': ['>', '...'],
            \   'cpp':['[cling]$','[cling]$ ?'],
            \   }
let g:repl_exit_commands = {
            \	"python": "quit()",
            \   "node":'.exit',
            \   "cling":".q",
            \	"bash": "exit",
            \	"zsh": "exit",
            \	"default": "exit",
            \	}

" quick-scope
let g:qs_max_chars=80
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"}}}

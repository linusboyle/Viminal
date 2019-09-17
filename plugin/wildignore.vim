" This file is taken from Tom Ryder's configuration
"
" Don't complete certain files that I'm not likely to want to manipulate from
" within Vim; this is kind of expensive to reload, so I've made it a plugin
" with a load guard

if &compatible || v:version < 700 || !has('wildignore')
  finish
endif

if exists('g:loaded_wildmenu')
  finish
endif

let g:loaded_wildmenu = 1

" Helper function for local scope
function! s:Wildignore() abort

  " New empty array
  let l:ignores = []

  " Archives
  let l:ignores += [
        \ '*.7z'
        \,'*.bz2'
        \,'*.gz'
        \,'*.jar'
        \,'*.rar'
        \,'*.tar'
        \,'*.xz'
        \,'*.zip'
        \ ]

  " Bytecode
  let l:ignores += [
        \ '*.class'
        \,'*.pyc'
        \ ]

  " Databases
  let l:ignores += [
        \ '*.db'
        \,'*.dbm'
        \,'*.sdbm'
        \,'*.sqlite'
        \ ]

  " Disk
  let l:ignores += [
        \ '*.adf'
        \,'*.bin'
        \,'*.hdf'
        \,'*.iso'
        \ ]

  " Documents
  let l:ignores += [
        \'*.djvu'
        \,'*.odp'
        \,'*.ods'
        \,'*.odt'
        \,'*.pdf'
        \,'*.doc'
        \,'*.docx'
        \,'*.ppt'
        \,'*.pptx'
        \,'*.xls'
        \,'*.xlsx'
        \ ]

  " Encrypted
  let l:ignores += [
        \ '*.asc'
        \,'*.gpg'
        \ ]

  " Executables
  let l:ignores += [
        \ '*.exe'
        \,'*.run'
        \ ]

  " Fonts
  let l:ignores += [
        \ '*.ttf'
        \,'*.otf'
        \ ]

  " Images
  let l:ignores += [
        \ '*.bmp'
        \,'*.gd2'
        \,'*.gif'
        \,'*.ico'
        \,'*.jpeg'
        \,'*.jpg'
        \,'*.pbm'
        \,'*.png'
        \,'*.psd'
        \,'*.tga'
        \,'*.xbm'
        \,'*.xcf'
        \,'*.xpm'
        \ ]

  " Incomplete
  let l:ignores += [
        \ '*.filepart'
        \ ]

  " Objects
  let l:ignores += [
        \ '*.a'
        \,'*.o'
        \,'*.obj'
        \,'*.dll'
        \,'*.so'
        \ ]

  " Sound
  let l:ignores += [
        \ '*.au'
        \,'*.aup'
        \,'*.flac'
        \,'*.mid'
        \,'*.m4a'
        \,'*.mp3'
        \,'*.ogg'
        \,'*.opus'
        \,'*.s3m'
        \,'*.wav'
        \ ]

  " System-specific
  let l:ignores += [
        \ '.DS_Store'
        \ ]

  " Translation
  let l:ignores += [
        \ '*.gmo'
        \ ]

  " Version control
  let l:ignores += [
        \ '.git'
        \,'.hg'
        \,'.svn'
        \ ]

  " Video
  let l:ignores += [
        \ '*.avi'
        \,'*.gifv'
        \,'*.mp4'
        \,'*.ogv'
        \,'*.rm'
        \,'*.swf'
        \,'*.webm'
        \ ]

  " Vim
  let l:ignores += [
        \ '*~'
        \,'*.swp'
        \ ]

  " ocaml/coq
  let l:ignores += [
        \ '*.vo'
        \,'*.cmi'
        \,'*.cmo'
        \ ]

  " If on a system where case matters for filenames, for any that had
  " lowercase letters, add their uppercase analogues
  if has('fname_case')
    for l:ignore in l:ignores
      if l:ignore =~# '\l'
        call add(l:ignores, toupper(l:ignore))
      endif
    endfor
  endif

  " Return the completed setting
  return join(l:ignores, ',')

endfunction

" Run helper function just defined
let &wildignore = s:Wildignore()

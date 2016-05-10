runtime! debian.vim

if has("syntax")
  syntax on
endif
filetype indent on
"colorscheme koehler
"colorscheme PaperColor
"colorscheme cootsbeauty256
set t_Co=256
"colorscheme jellybeans
colorscheme grimmjow
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
syntax enable
filetype plugin on
set tabstop=4
set noai
set showmatch
set shiftwidth=4
set nocp
set smartindent
set smarttab
set autoindent
set tags+=~/.vim/tags/kerntags
"set number
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
let g:livepreview_previewer = 'okular'
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0


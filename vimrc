runtime! debian.vim

if has("syntax")
  syntax on
endif
filetype indent on
"colorscheme koehler
colorscheme PaperColor
"colorscheme cootsbeauty256
set t_Co=256
"colorscheme jellybeans
"colorscheme grimmjow
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=light
" Establecemos la tipografia
set guifont=Hermit-bold/14

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
set number
"Omnicomplete para diferentes lenguajes.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType sql set omnifunc=sqlcomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
" Configuraciones para syntastic
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_shell = "/bin/bash"
"let g:syntastic_vim_checkers = ['vint']
let g:syntastic_python_exec = 'python3'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1 
let g:syntastic_ruby_exec = 'ruby'

"Completo el resaltado de syntaxis para python
let python_highlight_all = 1

"Quito los mensajes de error del plugin 
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_Color = 2

"Configuraciones para latexpreview
" Ocupa la siguiente opcion si usas KDE
let g:livepreview_previewer = 'okular'
" Ocupa la opcion siguiente si usas Gnome
"let g:livepreview_previewer = 'evince'
autocmd Filetype tex setl updatetime=1

"Configuracion jedi para python
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 1

" Agregando close tag para los archivos *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" Activando autopairs
let g:AutoPairsFlyMode = 1

" Activando Neocomplete
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Single compile
let g:SingleCompile_split = 'tabe'
let g:SingleCompile_resultsize = 5
"nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
"En el caso de que necesites alguna libreria 
"deberas cambiar por este modo de momento funciona para ncurses
autocmd Filetype c nmap <buffer> <F9> :SCCompileAF -g -O3 -lcurses <CR>
"autocmd Filetype c nmap <buffer> <F10> :SCCompileRunAF -lcurses <CR>

" SQL Complete
" Seleccionamos por defecto mysql
" Pero pueden otros mas sqlanywhere
" sqlhana, sqlinformix, sqloracle
let g:sql_type_default = 'mysql'

" Markdown preview
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1



"============================================================================
"File:        cpp.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Gregor Uhlenheuer <kongo2002 at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_cpp_gcc_checker')
    finish
endif
let g:loaded_syntastic_cpp_gcc_checker = 1

<<<<<<< HEAD
if !exists('g:syntastic_cpp_compiler_options')
    let g:syntastic_cpp_compiler_options = ''
=======
if !exists('g:syntastic_cpp_compiler')
    let g:syntastic_cpp_compiler = executable('g++') ? 'g++' : 'clang++'
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_cpp_gcc_IsAvailable() dict
<<<<<<< HEAD
    if !exists('g:syntastic_cpp_compiler')
        let g:syntastic_cpp_compiler = executable(self.getExec()) ? self.getExec() : 'clang++'
    endif
    return executable(expand(g:syntastic_cpp_compiler))
endfunction
=======
    return executable(expand(g:syntastic_cpp_compiler))
endfunction

if !exists('g:syntastic_cpp_compiler_options')
    let g:syntastic_cpp_compiler_options = ''
endif
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd

function! SyntaxCheckers_cpp_gcc_GetLocList() dict
    return syntastic#c#GetLocList('cpp', 'gcc', {
        \ 'errorformat':
        \     '%-G%f:%s:,' .
        \     '%f:%l:%c: %trror: %m,' .
        \     '%f:%l:%c: %tarning: %m,' .
        \     '%f:%l:%c: %m,'.
        \     '%f:%l: %trror: %m,'.
        \     '%f:%l: %tarning: %m,'.
        \     '%f:%l: %m',
        \ 'main_flags': '-x c++ -fsyntax-only',
        \ 'header_flags': '-x c++',
        \ 'header_names': '\m\.\(h\|hpp\|hh\)$' })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'cpp',
    \ 'name': 'gcc',
    \ 'exec': 'g++' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:

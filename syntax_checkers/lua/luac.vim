"============================================================================
"File:        lua.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Gregor Uhlenheuer <kongo2002 at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_lua_luac_checker")
    finish
endif
let g:loaded_syntastic_lua_luac_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_lua_luac_GetHighlightRegex(pos)
    let result = ''
    let near = matchstr(a:pos['text'], '\mnear ''\zs[^'']\+\ze''')
<<<<<<< HEAD
    if near != ''
=======
    if strlen(near) > 0
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd
        if near ==# '<eof>'
            let p = getpos('$')
            let a:pos['lnum'] = p[1]
            let a:pos['col'] = p[2]
            let result = '\%' . p[2] . 'c'
        else
<<<<<<< HEAD
            let result = '\V' . escape(near, '\')
=======
            let result = '\V' . near
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd
        endif

        " XXX the following piece of code is evil, and is likely to break
        " in future versions of syntastic; enable it at your own risk :)

        "let open = matchstr(a:pos['text'], '\m(to close ''\zs[^'']\+\ze'' at line [0-9]\+)')
<<<<<<< HEAD
        "if open != ''
        "    let line = str2nr(matchstr(a:pos['text'], '\m(to close ''[^'']\+'' at line \zs[0-9]\+\ze)'))
        "    let group = a:pos['type'] ==? 'E' ? 'SyntasticError' : 'SyntasticWarning'
        "    call matchadd(group, '\%' . line . 'l\V' . escape(open, '\'))
=======
        "if strlen(open) > 0
        "    let line = str2nr(matchstr(a:pos['text'], '\m(to close ''[^'']\+'' at line \zs[0-9]\+\ze)'))
        "    let group = a:pos['type'] ==? 'E' ? 'SyntasticError' : 'SyntasticWarning'
        "    call matchadd(group, '\%' . line . 'l\V' . open)
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd
        "endif
    endif
    return result
endfunction

function! SyntaxCheckers_lua_luac_GetLocList() dict
<<<<<<< HEAD
    let makeprg = self.makeprgBuild({ 'args_after': '-p' })
=======
    let makeprg = self.makeprgBuild({ 'args': '-p' })
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd

    let errorformat =  'luac: %#%f:%l: %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'defaults': { 'bufnr': bufnr(''), 'type': 'E' } })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'lua',
    \ 'name': 'luac'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:

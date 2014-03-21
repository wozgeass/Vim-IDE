if exists("g:loaded_syntastic_notifier_autoloclist") || !exists("g:loaded_syntastic_plugin")
    finish
endif
let g:loaded_syntastic_notifier_autoloclist = 1

let g:SyntasticAutoloclistNotifier = {}

" Public methods {{{1
"
function! g:SyntasticAutoloclistNotifier.New() " {{{2
    let newObj = copy(self)
    return newObj
endfunction " }}}2

<<<<<<< HEAD
function! g:SyntasticAutoloclistNotifier.refresh(loclist) " {{{2
=======
function! g:SyntasticAutoloclistNotifier.refresh(loclist)
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd
    call syntastic#log#debug(g:SyntasticDebugNotifications, 'autoloclist: refresh')
    call g:SyntasticAutoloclistNotifier.AutoToggle(a:loclist)
endfunction " }}}2

<<<<<<< HEAD
function! g:SyntasticAutoloclistNotifier.AutoToggle(loclist) " {{{2
    call syntastic#log#debug(g:SyntasticDebugNotifications, 'autoloclist: toggle')
    if !a:loclist.isEmpty()
        if syntastic#util#var('auto_loc_list') == 1
=======
function! g:SyntasticAutoloclistNotifier.AutoToggle(loclist)
    call syntastic#log#debug(g:SyntasticDebugNotifications, 'autoloclist: toggle')
    if !a:loclist.isEmpty()
        if g:syntastic_auto_loc_list == 1
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd
            call a:loclist.show()
        endif
    else
        if syntastic#util#var('auto_loc_list') > 0

            "TODO: this will close the loc list window if one was opened by
            "something other than syntastic
            lclose
        endif
    endif
endfunction " }}}2

" }}}1

" vim: set sw=4 sts=4 et fdm=marker:

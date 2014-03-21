if exists("g:loaded_syntastic_checker") || !exists("g:loaded_syntastic_plugin")
    finish
endif
let g:loaded_syntastic_checker = 1

let g:SyntasticChecker = {}

" Public methods {{{1

function! g:SyntasticChecker.New(args) " {{{2
    let newObj = copy(self)

    let newObj._filetype = a:args['filetype']
    let newObj._name = a:args['name']
    let newObj._exec = get(a:args, 'exec', newObj._name)
<<<<<<< HEAD
=======
    let newObj._makeprgFunc = function('SyntasticCheckerMakeprgBuild')
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd

    if has_key(a:args, 'redirect')
        let [filetype, name] = split(a:args['redirect'], '/')
        let prefix = 'SyntaxCheckers_' . filetype . '_' . name . '_'
    else
        let prefix = 'SyntaxCheckers_' . newObj._filetype . '_' . newObj._name . '_'
    endif

    let newObj._locListFunc = function(prefix . 'GetLocList')

    if exists('*' . prefix . 'IsAvailable')
        let newObj._isAvailableFunc = function(prefix . 'IsAvailable')
    else
        let newObj._isAvailableFunc = function('SyntasticCheckerIsAvailableDefault')
    endif

    if exists('*' . prefix . 'GetHighlightRegex')
        let newObj._highlightRegexFunc = function(prefix . 'GetHighlightRegex')
    endif

    return newObj
endfunction " }}}2

function! g:SyntasticChecker.getFiletype() " {{{2
    return self._filetype
endfunction " }}}2

function! g:SyntasticChecker.getName() " {{{2
    return self._name
endfunction " }}}2

function! g:SyntasticChecker.getExec() " {{{2
    if exists('g:syntastic_' . self._filetype . '_' . self._name . '_exec')
        return expand(g:syntastic_{self._filetype}_{self._name}_exec)
    endif

<<<<<<< HEAD
    return self._exec
endfunction " }}}2

function! g:SyntasticChecker.getExecEscaped() " {{{2
    return syntastic#util#shescape(self.getExec())
endfunction " }}}2

function! g:SyntasticChecker.getLocListRaw() " {{{2
=======
function! g:SyntasticChecker.getExec()
    if exists('g:syntastic_' . self._filetype . '_' . self._name . '_exec')
        return expand(g:syntastic_{self._filetype}_{self._name}_exec)
    endif

    return self._exec
endfunction

function! g:SyntasticChecker.getLocListRaw()
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd
    let name = self._filetype . '/' . self._name
    try
        let list = self._locListFunc()
        call syntastic#log#debug(g:SyntasticDebugTrace, 'getLocList: checker ' . name . ' returned ' . v:shell_error)
    catch /\m\C^Syntastic: checker error$/
        let list = []
        call syntastic#log#error('checker ' . name . ' returned abnormal status ' . v:shell_error)
    endtry
    call self._populateHighlightRegexes(list)
    call syntastic#log#debug(g:SyntasticDebugLoclist, name . ' raw:', list)
    call self._quietMessages(list)
    return list
<<<<<<< HEAD
endfunction " }}}2

function! g:SyntasticChecker.getLocList() " {{{2
    return g:SyntasticLoclist.New(self.getLocListRaw())
endfunction " }}}2
=======
endfunction

function! g:SyntasticChecker.getLocList()
    return g:SyntasticLoclist.New(self.getLocListRaw())
endfunction
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd

function! g:SyntasticChecker.makeprgBuild(opts) " {{{2
    let basename = self._filetype . '_' . self._name . '_'

<<<<<<< HEAD
    let parts = []
    call extend(parts, self._getOpt(a:opts, basename, 'exe', self.getExecEscaped()))
    call extend(parts, self._getOpt(a:opts, basename, 'args', ''))
    call extend(parts, self._getOpt(a:opts, basename, 'fname', syntastic#util#shexpand('%')))
    call extend(parts, self._getOpt(a:opts, basename, 'post_args', ''))
    call extend(parts, self._getOpt(a:opts, basename, 'tail', ''))

    return join(parts)
endfunction " }}}2

function! g:SyntasticChecker.isAvailable() " {{{2
=======
function! g:SyntasticChecker.makeprgBuild(opts)
    return self._makeprgFunc(a:opts)
endfunction

function! g:SyntasticChecker.isAvailable()
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd
    return self._isAvailableFunc()
endfunction " }}}2

" }}}1

" Private methods {{{1

<<<<<<< HEAD
function! g:SyntasticChecker._quietMessages(errors) " {{{2
    " wildcard quiet_messages
    let quiet_filters = copy(syntastic#util#var('quiet_messages', {}))
    if type(quiet_filters) != type({})
        call syntastic#log#warn('ignoring invalid syntastic_quiet_messages')
        unlet quiet_filters
        let quiet_filters = {}
    endif

    " per checker quiet_messages
    let name = self._filetype . '_' . self._name
    try
        call extend( quiet_filters, copy(syntastic#util#var(name . '_quiet_messages', {})), 'force' )
    catch /\m^Vim\%((\a\+)\)\=:E712/
        call syntastic#log#warn('ignoring invalid syntastic_' . name . '_quiet_messages')
    endtry

    call syntastic#log#debug(g:SyntasticDebugLoclist, 'quiet_messages filter:', quiet_filters)

    if !empty(quiet_filters)
        call syntastic#util#dictFilter(a:errors, quiet_filters)
        call syntastic#log#debug(g:SyntasticDebugLoclist, 'filtered by quiet_messages:', a:errors)
    endif
endfunction " }}}2

function! g:SyntasticChecker._populateHighlightRegexes(errors) " {{{2
    if has_key(self, '_highlightRegexFunc')
=======
function! g:SyntasticChecker._quietMessages(errors)
    let filter = 'g:syntastic_' . self._filetype . '_' . self._name . '_quiet_messages'
    if exists(filter) && type({filter}) == type({}) && !empty({filter})
        call syntastic#util#dictFilter(a:errors, {filter})
        call syntastic#log#debug(g:SyntasticDebugLoclist, 'filtered by ' . filter . ':', a:errors)
    endif
endfunction

function! g:SyntasticChecker._populateHighlightRegexes(errors)
    if !empty(self._highlightRegexFunc)
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd
        for e in a:errors
            if e['valid']
                let term = self._highlightRegexFunc(e)
                if len(term) > 0
                    let e['hl'] = term
                endif
            endif
        endfor
    endif
<<<<<<< HEAD
endfunction " }}}2

function! g:SyntasticChecker._getOpt(opts, basename, name, default) " {{{2
    let user_val = syntastic#util#var(a:basename . a:name)
    let ret = []
    call extend( ret, self._shescape(get(a:opts, a:name . '_before', '')) )
    call extend( ret, self._shescape(user_val != '' ? user_val : get(a:opts, a:name, a:default)) )
    call extend( ret, self._shescape(get(a:opts, a:name . '_after', '')) )

    return ret
endfunction " }}}2

function! g:SyntasticChecker._shescape(opt) " {{{2
    if type(a:opt) == type('') && a:opt != ''
        return [a:opt]
    elseif type(a:opt) == type([])
        return map(copy(a:opt), 'syntastic#util#shescape(v:val)')
    endif

    return []
endfunction " }}}2

" }}}1

" Non-method functions {{{1

function! SyntasticCheckerIsAvailableDefault() dict " {{{2
    return executable(self.getExec())
endfunction " }}}2

" }}}1
=======
endfunction

" Non-method functions {{{1

function! SyntasticCheckerIsAvailableDefault() dict
    return executable(self.getExec())
endfunction

function! SyntasticCheckerMakeprgBuild(opts) dict
    let builder = g:SyntasticMakeprgBuilder.New(
                \ get(a:opts, 'checker', self),
                \ get(a:opts, 'exe', ''),
                \ get(a:opts, 'args', ''),
                \ get(a:opts, 'fname', ''),
                \ get(a:opts, 'post_args', ''),
                \ get(a:opts, 'tail', '') )

    return builder.makeprg()
endfunction
>>>>>>> 4c33b4be3c77a773e81a7fdffd102ec16be4e3cd

" vim: set sw=4 sts=4 et fdm=marker:

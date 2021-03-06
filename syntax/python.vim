" Vim syntax file
" Language:             Python
" Current Maintainer:   Adrian Perez Dominguez <adrian<at>aztli.org>
" Last Previous Maintainer: Dmitry Vasilev <dima at hlabs dot org>
" Previous Maintainer:  Neil Schemenauer <nas at python dot ca>
" URL:                  https://github.com/hdima/python-syntax
" Last Change:          2016-09-12
" Filenames:            *.py
" Version:              3.6.0
"
" Based on python.vim (from Vim 6.1 distribution)
" by Dmitry Vasilev <nas at python dot ca>
"
" Please use the following channels for reporting bugs, offering suggestions or
" feedback:

" - python.vim issue tracker: https://github.com/wozgeass/Vim-IDE/issue
" - Email: Adrian Perez (adrian<at>aztli.org)
" - Send a message or follow me for updates on Twitter: `@lelouch_linux
"   <https://twitter.com/lelouch_linux>`__
"
" Contributors
" ============
"
" List of the contributors in alphabetical order:
"
"   Andrea Riciputi
"   Anton Butanaev
"   Antony Lee
"   Caleb Adamantine
"   David Briscoe
"   Elizabeth Myers
"   Ihor Gorobets
"   Jeroen Ruigrok van der Werven
"   John Eikenberry
"   Joongi Kim
"   Marc Weber
"   Pedro Algarvio
"   Victor Salgado
"   Will Gray
"   Yuri Habrusiev
"
" Options
" =======
"
"    :let OPTION_NAME = 1                   Enable option
"    :let OPTION_NAME = 0                   Disable option
"
"
" Option to select Python version
" -------------------------------
"
"    python_version_2                       Enable highlighting for Python 2
"                                           (Python 3 highlighting is enabled
"                                           by default). Can also be set as
"                                           a buffer (b:python_version_2)
"                                           variable.
"
"    You can also use the following local to buffer commands to switch
"    between two highlighting modes:
"
"    :Python2Syntax                         Switch to Python 2 highlighting
"                                           mode
"    :Python3Syntax                         Switch to Python 3 highlighting
"                                           mode
"
" Option names used by the script
" -------------------------------
"
"    python_highlight_builtins              Highlight builtin functions and
"                                           objects
"      python_highlight_builtin_objs        Highlight builtin objects only
"      python_highlight_builtin_funcs       Highlight builtin functions only
"    python_highlight_exceptions            Highlight standard exceptions
"    python_highlight_string_formatting     Highlight % string formatting
"    python_highlight_string_format         Highlight str.format syntax
"    python_highlight_string_templates      Highlight string.Template syntax
"    python_highlight_indent_errors         Highlight indentation errors
"    python_highlight_space_errors          Highlight trailing spaces
"    python_highlight_doctests              Highlight doc-tests
"    python_print_as_function               Highlight 'print' statement as
"                                           function for Python 2
"    python_highlight_file_headers_as_comments
"                                           Highlight shebang and coding
"                                           headers as comments
"
"    python_highlight_all                   Enable all the options above
"                                           NOTE: This option don't override
"                                           any previously set options
"
"    python_slow_sync                       Can be set to 0 for slow machines
"

" For version 5.x: Clear all syntax items
" For versions greater than 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"
" Commands
"
command! -buffer Python2Syntax let b:python_version_2 = 1 | let &syntax=&syntax
command! -buffer Python3Syntax let b:python_version_2 = 0 | let &syntax=&syntax

" Enable option if it's not defined
function! s:EnableByDefault(name)
  if !exists(a:name)
    let {a:name} = 1
  endif
endfunction

" Check if option is enabled
function! s:Enabled(name)
  return exists(a:name) && {a:name}
endfunction

" Is it Python 2 syntax?
function! s:Python2Syntax()
  if exists("b:python_version_2")
      return b:python_version_2
  endif
  return s:Enabled("g:python_version_2")
endfunction

"
" Default options
"

call s:EnableByDefault("g:python_slow_sync")

if s:Enabled("g:python_highlight_all")
  call s:EnableByDefault("g:python_highlight_builtins")
  if s:Enabled("g:python_highlight_builtins")
    call s:EnableByDefault("g:python_highlight_builtin_objs")
    call s:EnableByDefault("g:python_highlight_builtin_funcs")
  endif
  call s:EnableByDefault("g:python_highlight_exceptions")
  call s:EnableByDefault("g:python_highlight_string_formatting")
  call s:EnableByDefault("g:python_highlight_string_format")
  call s:EnableByDefault("g:python_highlight_string_templates")
  call s:EnableByDefault("g:python_highlight_indent_errors")
  call s:EnableByDefault("g:python_highlight_space_errors")
  call s:EnableByDefault("g:python_highlight_doctests")
  call s:EnableByDefault("g:python_print_as_function")
endif

"
" Keywords
"

syn keyword pythonStatement     break continue del
syn keyword pythonStatement     exec return
syn keyword pythonStatement     pass raise
syn keyword pythonStatement     global assert
syn keyword pythonStatement     lambda
syn keyword pythonStatement     with
syn keyword pythonStatement     def class nextgroup=pythonFunction skipwhite
syn keyword pythonRepeat        for while
syn keyword pythonConditional   if elif else
" The standard pyrex.vim unconditionally removes the pythonInclude group, so
" we provide a dummy group here to avoid crashing pyrex.vim.
syn keyword pythonInclude       import
syn keyword pythonImport        import
syn keyword pythonException     try except finally
syn keyword pythonOperator      and in is not or

syn match pythonStatement   "\<yield\>" display
syn match pythonImport      "\<from\>" display

if s:Python2Syntax()
  if !s:Enabled("g:python_print_as_function")
    syn keyword pythonStatement  print
  endif
  syn keyword pythonImport      as
  syn match   pythonFunction    "[a-zA-Z_][a-zA-Z0-9_]*" display contained
else
  syn keyword pythonStatement   as nonlocal None
  syn match   pythonStatement   "\<yield\s\+from\>" display
  syn keyword pythonBoolean     True False
  syn match   pythonFunction    "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
  syn keyword pythonStatement   await
  syn match   pythonStatement   "\<async\s\+def\>" nextgroup=pythonFunction skipwhite
  syn match   pythonStatement   "\<async\s\+with\>" display
  syn match   pythonStatement   "\<async\s\+for\>" display
endif

"
" Decorators (new in Python 2.4)
"

syn match   pythonDecorator	"@" display nextgroup=pythonDottedName skipwhite
if s:Python2Syntax()
  syn match   pythonDottedName "[a-zA-Z_][a-zA-Z0-9_]*\%(\.[a-zA-Z_][a-zA-Z0-9_]*\)*" display contained
else
  syn match   pythonDottedName "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\)*" display contained
endif
syn match   pythonDot        "\." display containedin=pythonDottedName

"
" Comments
"

syn match   pythonComment	"#.*$" display contains=pythonTodo,@Spell
if !s:Enabled("g:python_highlight_file_headers_as_comments")
  syn match   pythonRun		"\%^#!.*$"
  syn match   pythonCoding	"\%^.*\%(\n.*\)\?#.*coding[:=]\s*[0-9A-Za-z-_.]\+.*$"
endif
syn keyword pythonTodo		TODO FIXME XXX contained

"
" Errors
"

syn match pythonError		"\<\d\+\D\+\>" display
syn match pythonError		"[$?]" display
syn match pythonError		"[&|]\{2,}" display
syn match pythonError		"[=]\{3,}" display

" Mixing spaces and tabs also may be used for pretty formatting multiline
" statements
if s:Enabled("g:python_highlight_indent_errors")
  syn match pythonIndentError	"^\s*\%( \t\|\t \)\s*\S"me=e-1 display
endif

" Trailing space errors
if s:Enabled("g:python_highlight_space_errors")
  syn match pythonSpaceError	"\s\+$" display
endif

"
" Strings
"

if s:Python2Syntax()
  " Python 2 strings
  syn region pythonString   start=+[bB]\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+[bB]\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+[bB]\="""+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonString   start=+[bB]\='''+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
else
  " Python 3 byte strings
  syn region pythonBytes		start=+[bB]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
  syn region pythonBytes		start=+[bB]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
  syn region pythonBytes		start=+[bB]"""+ end=+"""+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonBytes		start=+[bB]'''+ end=+'''+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest,pythonSpaceError,@Spell

  syn match pythonBytesError    ".\+" display contained
  syn match pythonBytesContent  "[\u0000-\u00ff]\+" display contained contains=pythonBytesEscape,pythonBytesEscapeError
endif

syn match pythonBytesEscape       +\\[abfnrtv'"\\]+ display contained
syn match pythonBytesEscape       "\\\o\o\=\o\=" display contained
syn match pythonBytesEscapeError  "\\\o\{,2}[89]" display contained
syn match pythonBytesEscape       "\\x\x\{2}" display contained
syn match pythonBytesEscapeError  "\\x\x\=\X" display contained
syn match pythonBytesEscape       "\\$"

syn match pythonUniEscape         "\\u\x\{4}" display contained
syn match pythonUniEscapeError    "\\u\x\{,3}\X" display contained
syn match pythonUniEscape         "\\U\x\{8}" display contained
syn match pythonUniEscapeError    "\\U\x\{,7}\X" display contained
syn match pythonUniEscape         "\\N{[A-Z ]\+}" display contained
syn match pythonUniEscapeError    "\\N{[^A-Z ]\+}" display contained

if s:Python2Syntax()
  " Python 2 Unicode strings
  syn region pythonUniString  start=+[uU]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonUniString  start=+[uU]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonUniString  start=+[uU]"""+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonUniString  start=+[uU]'''+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
else
  " Python 3 strings
  syn region pythonString   start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+"""+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonString   start=+'''+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
endif

if s:Python2Syntax()
  " Python 2 Unicode raw strings
  syn region pythonUniRawString start=+[uU][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
  syn region pythonUniRawString start=+[uU][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
  syn region pythonUniRawString start=+[uU][rR]"""+ end=+"""+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonUniRawString start=+[uU][rR]'''+ end=+'''+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest,pythonSpaceError,@Spell

  syn match  pythonUniRawEscape       "\([^\\]\(\\\\\)*\)\@<=\\u\x\{4}" display contained
  syn match  pythonUniRawEscapeError  "\([^\\]\(\\\\\)*\)\@<=\\u\x\{,3}\X" display contained
endif

" Python 2/3 raw strings
if s:Python2Syntax()
  syn region pythonRawString  start=+[bB]\=[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[bB]\=[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[bB]\=[rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonRawString  start=+[bB]\=[rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell
else
  syn region pythonRawString  start=+[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonRawString  start=+[rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell

  syn region pythonRawBytes  start=+[bB][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawBytes  start=+[bB][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawBytes  start=+[bB][rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonRawBytes  start=+[bB][rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell
endif

syn match pythonRawEscape +\\['"]+ display transparent contained

if s:Enabled("g:python_highlight_string_formatting")
  " % operator string formatting
  if s:Python2Syntax()
    syn match pythonStrFormatting	"%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrFormatting	"%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
  else
    syn match pythonStrFormatting	"%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonRawString
    syn match pythonStrFormatting	"%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonRawString
  endif
endif

if s:Enabled("g:python_highlight_string_format")
  " str.format syntax
  if s:Python2Syntax()
    syn match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrFormat	"{\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)\=\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\[\%(\d\+\|[^!:\}]\+\)\]\)*\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
  else
    syn match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonRawString
    syn match pythonStrFormat	"{\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)\=\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\[\%(\d\+\|[^!:\}]\+\)\]\)*\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonRawString
  endif
endif

if s:Enabled("g:python_highlight_string_templates")
  " string.Template format
  if s:Python2Syntax()
    syn match pythonStrTemplate	"\$\$" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrTemplate	"\${[a-zA-Z_][a-zA-Z0-9_]*}" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrTemplate	"\$[a-zA-Z_][a-zA-Z0-9_]*" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
  else
    syn match pythonStrTemplate	"\$\$" contained containedin=pythonString,pythonRawString
    syn match pythonStrTemplate	"\${[a-zA-Z_][a-zA-Z0-9_]*}" contained containedin=pythonString,pythonRawString
    syn match pythonStrTemplate	"\$[a-zA-Z_][a-zA-Z0-9_]*" contained containedin=pythonString,pythonRawString
  endif
endif

if s:Enabled("g:python_highlight_doctests")
  " DocTests
  syn region pythonDocTest	start="^\s*>>>" end=+'''+he=s-1 end="^\s*$" contained
  syn region pythonDocTest2	start="^\s*>>>" end=+"""+he=s-1 end="^\s*$" contained
endif

"
" Numbers (ints, longs, floats, complex)
"

if s:Python2Syntax()
  syn match   pythonHexError	"\<0[xX]\x*[g-zG-Z]\+\x*[lL]\=\>" display
  syn match   pythonOctError	"\<0[oO]\=\o*\D\+\d*[lL]\=\>" display
  syn match   pythonBinError	"\<0[bB][01]*\D\+\d*[lL]\=\>" display

  syn match   pythonHexNumber	"\<0[xX]\x\+[lL]\=\>" display
  syn match   pythonOctNumber "\<0[oO]\o\+[lL]\=\>" display
  syn match   pythonBinNumber "\<0[bB][01]\+[lL]\=\>" display

  syn match   pythonNumberError	"\<\d\+\D[lL]\=\>" display
  syn match   pythonNumber	"\<\d[lL]\=\>" display
  syn match   pythonNumber	"\<[0-9]\d\+[lL]\=\>" display
  syn match   pythonNumber	"\<\d\+[lLjJ]\>" display

  syn match   pythonOctError	"\<0[oO]\=\o*[8-9]\d*[lL]\=\>" display
  syn match   pythonBinError	"\<0[bB][01]*[2-9]\d*[lL]\=\>" display
else
  syn match   pythonHexError	"\<0[xX]\x*[g-zG-Z]\x*\>" display
  syn match   pythonOctError	"\<0[oO]\=\o*\D\+\d*\>" display
  syn match   pythonBinError	"\<0[bB][01]*\D\+\d*\>" display

  syn match   pythonHexNumber	"\<0[xX]\x\+\>" display
  syn match   pythonOctNumber "\<0[oO]\o\+\>" display
  syn match   pythonBinNumber "\<0[bB][01]\+\>" display

  syn match   pythonNumberError	"\<\d\+\D\>" display
  syn match   pythonNumberError	"\<0\d\+\>" display
  syn match   pythonNumber	"\<\d\>" display
  syn match   pythonNumber	"\<[1-9]\d\+\>" display
  syn match   pythonNumber	"\<\d\+[jJ]\>" display

  syn match   pythonOctError	"\<0[oO]\=\o*[8-9]\d*\>" display
  syn match   pythonBinError	"\<0[bB][01]*[2-9]\d*\>" display
endif

syn match   pythonFloat		"\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>" display
syn match   pythonFloat		"\<\d\+[eE][+-]\=\d\+[jJ]\=\>" display
syn match   pythonFloat		"\<\d\+\.\d*\%([eE][+-]\=\d\+\)\=[jJ]\=" display

"
" Builtin objects and types
"

if s:Enabled("g:python_highlight_builtin_objs")
  if s:Python2Syntax()
    syn keyword pythonBuiltinObj	None
    syn keyword pythonBoolean		True False
  endif
  syn keyword pythonBuiltinObj	Ellipsis NotImplemented
  syn keyword pythonBuiltinObj	__debug__ __doc__ __file__ __name__ __package__
endif

"
" Builtin functions
"

if s:Enabled("g:python_highlight_builtin_funcs")
  if s:Python2Syntax()
    syn keyword pythonBuiltinFunc	apply basestring buffer callable coerce
    syn keyword pythonBuiltinFunc	execfile file help intern long raw_input
    syn keyword pythonBuiltinFunc	reduce reload unichr unicode xrange
    if s:Enabled("g:python_print_as_function")
      syn keyword pythonBuiltinFunc	print
    endif
  else
    syn keyword pythonBuiltinFunc	ascii exec memoryview print
  endif
  " Libreria python3
  syn keyword pythonClass string re difflib textwrap unicodedata stringprep
  syn keyword pythonClass readline rlcompleter struct codecs datetime calendar
  syn keyword pythonClass collections heapq bisect array weakref types pprint
  syn keyword pythonClass reprlib enum numbers math cmath decimal fractions
  syn keyword pythonClass random statistics itertools functools operator
  syn keyword pythonClass pathlib fileinput stat filecmp tempfile glob fnmatch
  syn keyword pythonClass linecache shutil macpath pickle copyreg shelve marshal
  syn keyword pythonClass dbm sqlite3 zlib gzip bz2 lzma zipfile tarfile cvs
  syn keyword pythonClass configparser netrc xdrlib plistlib hashlib hmac
  syn keyword pythonClass os io time argparse getopt logging getpass curses
  syn keyword pythonClass platform errno ctypes threading multiprocessing
  syn keyword pythonClass concurrent subprocess sched queue dummy _thread 
  syn keyword pythonClass socket ssl select selectors asyncio asyncore asynchat
  syn keyword pythonClass signal mmap email json mailcap mailbox mimetypes
  syn keyword pythonClass base64 binhex binascii quopri uu html xml  webbrowser
  syn keyword pythonClass cgi cgitb wsgiref urllib http ftplib poplib imaplib 
  syn keyword pythonClass nntplib smtplib smtpd telnetlib uuid socketserver
  syn keyword pythonClass xmlrpc ipaddress audioop aifc sunau wave chunk colorsys
  syn keyword pythonClass imghdr sndhdr ossaudiodev gettext locale turtle cmd
  syn keyword pythonClass shlex tkinter PyGObject PyQt PySide wxPython pygtk gi
  syn keyword pythonClass typing pydoc doctest unittest test bdb faulthandler
  syn keyword pythonClass pdb timeit trace tracemalloc distutils ensurepip
  syn keyword pythonClass venv zipapp sys sysconfig builtins warnings contextlib
  syn keyword pythonClass abc atexit traceback gc inspect site fpectl code codeop
  syn keyword pythonClass zipimport pkgutil modulefinder runpy importlib parser
  syn keyword pythonClass ast symtable symbol token keyword tokenize tabnanny
  syn keyword pythonClass pyclbr py_compile compileall dis pickletools formatter
  syn keyword pythonClass msilib msvcrt winreg winsound posix pwd spwd grp crypt
  syn keyword pythonClass termios tty pty fcntl pipes resource nis syslog optparse
  syn keyword pythonClass imp serial simpleaudio
  syn keyword pythonBuiltinFunc	__import__ abs all any
  syn keyword pythonBuiltinFunc	bin bool bytearray bytes
  syn keyword pythonBuiltinFunc	chr classmethod cmp compile complex
  syn keyword pythonBuiltinFunc	delattr dict dir divmod enumerate eval
  syn keyword pythonBuiltinFunc	filter float format frozenset getattr
  syn keyword pythonBuiltinFunc	globals hasattr hash hex id
  syn keyword pythonBuiltinFunc	input int isinstance
  syn keyword pythonBuiltinFunc	issubclass iter len list locals map max
  syn keyword pythonBuiltinFunc	min next object oct open ord
  syn keyword pythonBuiltinFunc	pow property range
  syn keyword pythonBuiltinFunc	repr reversed round set setattr
  syn keyword pythonBuiltinFunc	slice sorted staticmethod str sum super tuple
  syn keyword pythonBuiltinFunc	type vars zip 
  " Metodos de los tipos numericos
  syn keyword pythonBuiltinFunc conjugate trunc floor ceil bit_length 
  syn keyword pythonBuiltinFunc to_bytes from_bytes as_integer_ratio
  syn keyword pythonBuiltinFunc is_integer fromhex index count append 
  syn keyword pythonBuiltinFunc clear extend insert pop remove reverse
  " Metodos de los tipos cadena
  syn keyword pythonBuiltinFunc capitalize casefold center count encode
  syn keyword pythonBuiltinFunc endswitch expandtabs find format format_map
  syn keyword pythonBuiltinFunc index isalnum isalpha isdecimal isdigit
  syn keyword pythonBuiltinFunc isidentifier islower isnumeric isprintable
  syn keyword pythonBuiltinFunc isspace istitle isupper join ljust lower
  syn keyword pythonBuiltinFunc lstrip maketrans partition replace rfind 
  syn keyword pythonBuiltinFunc rindex rjust rpartition rsplit rstrip split
  syn keyword pythonBuiltinFunc splitlines startswith strip swapcase title
  syn keyword pythonBuiltinFunc translate upper zfill 
  " Metodos de memoryview
  syn keyword pythonBuiltinFunc tobytes tolist release cast nbytes readonly
  syn keyword pythonBuiltinFunc itemsize ndim shape strides suboffset
  syn keyword pythonBuiltinFunc c_contiguous f_contiguous contiguous 
  " Metodos de set frozenset
  syn keyword pythonBuiltinFunc isdistjoint issubset issuperset union intersection
  syn keyword pythonBuiltinFunc difference symmetric_difference copy update
  syn keyword pythonBuiltinFunc intersection_update difference_update clear
  syn keyword pythonBuiltinFunc symmetric_difference_update add remove discard
  " Metodos de diccionarios
  syn keyword pythonBuiltinFunc get items keys popitem setdefault values
  " Metodos de clase string
  syn keyword pythonBuiltinFunc ascii_letters ascii_lowercase ascii_lowercase
  syn keyword pythonBuiltinFunc digits hexdigits octdigits punctuation printable
  syn keyword pythonBuiltinFunc whitespace vformat parse get_field get_value
  syn keyword pythonBuiltinFunc check_unused_args format_field convert_field
  syn keyword pythonBuiltinFunc capwords
  " Metodos de clase String.Template
  syn keyword pythonBuiltinObj substitute safe_substitute template
  "
  " Metodos de operaciones de la libreria re
  "
  syn keyword pythonBuiltinFunc A ASCII DEBUG I IGNORECASE L LOCALE M MULTILINE
  syn keyword pythonBuiltinFunc S DOTALL X VERBOSE search match fullmatch findall
  syn keyword pythonBuiltinFunc sub subn scape purge
  " Metodos de operaciones de Expresiones en los objetos
  syn keyword pythonBuiltinObj finditer flags groups groupindex patternt
  " Metodos de operaciones de Objetos match
  syn keyword pythonBuiltinObj expand groupdict start end span pos endpos
  syn keyword pythonBuiltinObj lastindex lastgroup re 
  "
  " Metodos de la libreria difflib 
  "
  syn keyword pythonBuiltinFunc Differ HtmlDiff context_diff get_close_matches
  syn keyword pythonBuiltinFunc ndiff restore unified_diff diff_bytes IS_LINE_JUNK
  syn keyword pythonBuiltinFunc IS_CHARACTER_JUNK
  " Metodos del objeto SequenceMatcher
  syn keyword pythonBuiltinObj SequenseMatcher set_seqs set_seq1 set_seq2
  syn keyword pythonBuiltinObj find_longest_match get_matching blocks get_opcodes
  syn keyword pythonBuiltinObj set_grouped_opcodes ratio quick_ratio real_quick_ratio
  " Metodos del Objeto Differ
  syn keyword pythonBuiltinObj Differ compare
  " Metodos del objeto HtmlDiff
  syn keyword pythonBuiltinObj make_file make_table
  "
  " Metodos de la libreria textwrap
  "
  syn keyword pythonBuiltinFunc wrap fill shorten dedent indent
  " Metodos del objeto TextWrapper
  syn keyword pythonBuiltinObj width expand_tabs tabsize replace_whitespace
  syn keyword pythonBuiltinObj drop_whitespace initial_indent subsequent_indent
  syn keyword pythonBuiltinObj fix_sentence_endings break_long_words break_on_hyphens
  syn keyword pythonBuiltinObj max_lines placeholder wrap fill
  "
  " Metodos de la libreria unicodedata
  "
  syn keyword pythonBuiltinFunc lookup name decimal digit numeric category
  syn keyword pythonBuiltinFunc bidirectional combining east_asian_width mirrored
  syn keyword pythonBuiltinFunc decomposition normalize unidata_version ucd_3_2_0
  "
  " Metodos de la libreria stringprep
  "
  syn keyword pythonBuiltinFunc in_table_a1 in_table_b1 map_table_b2 map_table_b3
  syn keyword pythonBuiltinFunc in_table_c11 in_table_c12 in_table_c11_c12 
  syn keyword pythonBuiltinFunc in_table_c21 in_table_c22 in_table_c21_c22
  syn keyword pythonBuiltinFunc in_table_c3 in_table_c4 in_table_c5 in_table_c6
  syn keyword pythonBuiltinFunc in_table_c7 in_table_c8 in_table_c9
  syn keyword pythonBuiltinFunc in_table_d1 in_table_d2
  "
  " Metodos de la libreria readlinte
  "
  syn keyword pythonBuiltinFunc parse_and_bind read_init_file get_line_buffer
  syn keyword pythonBuiltinFunc insert_text redisplay read_history_file
  syn keyword pythonBuiltinFunc write_history_file append_history_file
  syn keyword pythonBuiltinFunc get_history_length set_history_length
  syn keyword pythonBuiltinFunc clear_history get_current_history_length 
  syn keyword pythonBuiltinFunc get_history_item remove_history_item 
  syn keyword pythonBuiltinFunc replace_history_item add_history get_begidx
  syn keyword pythonBuiltinFunc set_startup_hook set_pre_input_hook
  syn keyword pythonBuiltinFunc set_completer get_completer get_completion_type
  syn keyword pythonBuiltinFunc get_endidx set_completer_delims
  syn keyword pythonBuiltinFunc get_completer_delims 
  syn keyword pythonBuiltinFunc set_completion_display_matches_hook
  " 
  " Metodos de la libreria rlcompleter
  "
  syn keyword pythonBuiltinFunc  complete
  "
  " Metodos de la libreria struct
  "
  syn keyword pythonBuiltinFunc pack pack_into unpack unpack_from iter_unpack 
  syn keyword pythonBuiltinFunc calcsize
  " Metodos del objeto Struct
  syn keyword pythonBuiltinObj size
  "
  " Metodos de la libreria codecs
  "
  syn keyword pythonBuiltinFunc encode decode lookup getencoder getdecoder 
  syn keyword pythonBuiltinFunc getincrementalencoder getincrementaldecoder
  syn keyword pythonBuiltinFunc getreader getwriter register open EncodedFile 
  syn keyword pythonBuiltinFunc iterencode iterdecode register_error
  syn keyword pythonBuiltinFunc lookup_error strict_errors replace_errors
  syn keyword pythonBuiltinFunc ignore_errors xmlcharrefreplace_errors
  syn keyword pythonBuiltinFunc backslashreplace_errors namereplace_errors
  " Metodos del objeto IncrementalEncoder
  syn keyword pythonBuiltinObj encode reset getstate setstate 
  " Metodos del objeto IncrementalDecoder
  syn keyword pythonBuiltinObj decode reset getstate setstate
  " Metodos del objeto StreamWriter
  syn keyword pythonBuiltinObj write writelines reset
  " Metodos del objeto StreamReader
  syn keyword pythonBuiltinObj read readlines reset
  "
  " Metodos de la libreria datetime
  "
  " Metodos del Objeto timedelta
  syn keyword pythonBuiltinObj total_seconds
  " Metodos del Objeto Date
  syn keyword pythonBuiltinObj date today fromtimestamp fromordinal timetuple
  syn keyword pythonBuiltinObj toordinal weekday isoweekday isocalendar 
  syn keyword pythonBuiltinObj isoformat ctime strftime
  " Metodos del Objeto datetime
  syn keyword pythonBuiltinObj now utcnow utcfromtimestamp combine strptime date
  syn keyword pythonBuiltinObj timetz astimezone utcoffset dst tzname utctimetuple
  syn keyword pythonBuiltinObj timestamp
  " Metodos del Objeto time
  " Metodos del Objeto tzinfo
  syn keyword pythonBuiltinObj fromutc 
  "
  " Metodos de la libreria Calendar
  "
  syn keyword pythonBuiltinFunc iterweekdays itermonthdates itermonthdays2
  syn keyword pythonBuiltinFunc itermonthdays monthdatescalendar monthdays2calendar
  syn keyword pythonBuiltinFunc monthdayscalendar yeardatescalendar yeardays2calendar
  syn keyword pythonBuiltinFunc yeardayscalendar TextCalendar HTMLCalendar
  syn keyword pythonBuiltinFunc LocaleTextCalendar LocaleHTMLCalendar setfirstweekday
  syn keyword pythonBuiltinFunc firstweekday isleap leapdays weekday weekheader
  syn keyword pythonBuiltinFunc monthrange monthcalendar prmonth month prcal timegm
  " Metodos del objeto TextCalendar
  syn keyword pythonBuiltinObj formatmonth prmonth formatyear pryear
  " Metodos del objeto HTMLCalendar
  syn keyword pythonBuiltinObj formatyearpage
  "
  " Metodos de la libreria collections
  "
  syn keyword pythonBuiltinFunc ChainMap deque Counter OrderedDict defaultdict
  syn keyword pythonBuiltinFunc UserDict UserList UserString namedtuples
  " Metodos del objeto ChainMap
  syn keyword pythonBuiltinObj new_child
  " Metodos del objeto Counter
  syn keyword pythonBuiltinObj elements most_common subtract fromkeys
  " Metodos del objeto deque
  syn keyword pythonBuiltinObj appendleft extendleft popleft rotate
  " Metodos del objeto defaultdict
  syn keyword pythonBuiltinObj default_factory
  " Metodos del objeto OrderedDict 
  syn keyword pythonBuiltinObj move_to_end 
  "
  " Metodos de la libreria heapq
  "
  syn keyword pythonBuiltinFunc heappush heappop heappushpop heapify heapreplace
  syn keyword pythonBuiltinFunc merge nlargest nsmallest
  "
  " Metodos de la libreria bisect
  "
  syn keyword pythonBuiltinFunc bisect_left bisect_right insort_left insort_right
  syn keyword pythonBuiltinFunc insort
  "
  " Metodos de la libreria array
  "
  syn keyword pythonBuiltinFunc buffer_info byteswap formbytes fromfile fromlist
  syn keyword pythonBuiltinFunc fromunicode tofile tostring tounicode
  " 
  " Metodos de la libreria weakref
  "
  syn keyword pythonBuiltinFunc ref proxy getweakrefcount getweakrefs
  syn keyword pythonBuiltinFunc WeakKeyDictionary keyrefs WeakValueDictionary
  syn keyword pythonBuiltinFunc valuerefs WeakSet WeakMethod finalize detach peek
  "
  " Metodos de la libreria types
  "
  syn keyword pythonBuiltinFunc new_class prepare_class ModuleType MappingProxyType
  syn keyword pythonBuiltinFunc a




  "
  " Metodos de la libreria simpleaudio
  "
  syn keyword pythonBuiltinFunc WaveObject PlayObject stop_all play_buffer
  syn keyword pythonBuiltinFunc functionchecks sleep
  " Metodos del Objeto WaveObject 
  syn keyword pythonBuiltinObj play from_wave_file from_wave_read
  " Metodos del objeto PlayObject
  syn keyword pythonBuiltinObj stop is_playing wait_done 
  " Metodos del objeto functionchecks
  syn keyword pythonBuiltinObj run_all FunctionCheckBase LeftRightCheck OverlappingCheck
  syn keyword pythonBuiltinObj StopCheck StopAllCheck IsPlayingCheck WaitDoneCheck
  "
  " Metodos de la libreria Serial
  "
  syn keyword pythonBuiltinAttr port baudrate bytesize parity stopbits timeout xonxoff
  syn keyword pythonBuiltinAttr dsrdtr write_timeout inter_byte_timeout name cts dtr
  syn keyword pythonBuiltinAttr cts dts ri cd is_open rs485_mode
  syn keyword pythonBuiltinFunc close flush reset_input_buffer reset_output_buffer
  syn keyword pythonBuiltinFunc break_condition io rs485.RS485Settings Serial SerialBase 
  syn keyword pythonBuiltinCons BAUDRATES BYTESIZES PARITIES STOPBITS PARITY_NONE
  syn keyword pythonBuiltinCons PARITY_ODD PARITY_MARK PARITY_SPACE STOPBITS_ONE
  syn keyword pythonBuiltinCons STOPBITS_ONE_POINT_FIVE STOPBITS_TWO FIVEBITS SIXBITS
  syn keyword pythonBuiltinCons SEVENBITS EIGHTBITS XON XOFF VERSION
  " Metodos del objeto io
  syn keyword pythonBuiltinObj readable writable seekable readinto get_settings
  syn keyword pythonBuiltinObj apply_settings nonblocking fileno set_input_flow_control
  syn keyword pythonBuiltinObj set_output_flow_control cancel_read cancel_write
  syn keyword pythonExClass SerialException
  "
  " Metodos de la libreria gi.repository para programar en GTK
  "
  syn keyword pythonBuiltinFunc require_foreign require_versions version_info
  syn keyword pythonBuiltinFunc check_version get_required_version repository
  syn keyword pythonBuiltinFunc Gtk Atk Glib Gdk GModule GObject Gio cairo Pango
  syn keyword pythonBuiltinFunc GdkPixbuf GdkX11 xlib
  " Metodos de la clase GTK
  syn keyword pythonBuiltinObj AboutDialog AboutDialogClass AboutDialogPrivate AccelFlags
  syn keyword pythonBuiltinObj AccelGroup AccelGroupClass AccelGroupEntry AccelGroupPrivate
  syn keyword pythonBuiltinObj AccelKey AccelLabel AccelLabelClass AccelLabelPrivate
  syn keyword pythonBuiltinObj AceelMap AccelMapClass Accesible AccessibleClass
  syn keyword pythonBuiltinObj AccessiblePrivate Action ActionBar ActionBarClass
  syn keyword pythonBuiltinObj ActionBarPrivate ActionClass ActionEntry ActionGroup
  syn keyword pythonBuiltinObj ActionGroupClass ActionGroupPrivate ActionPrivate
  syn keyword pythonBuiltinObj b
  "
  " Metodos de librerias externas
  "
endi

"
" Builtin exceptions and warnings
"

if s:Enabled("g:python_highlight_exceptions")
  if s:Python2Syntax()
    syn keyword pythonExClass	StandardError
  else
    syn keyword pythonExClass	BlockingIOError ChildProcessError
    syn keyword pythonExClass	ConnectionError BrokenPipeError
    syn keyword pythonExClass	ConnectionAbortedError ConnectionRefusedError
    syn keyword pythonExClass	ConnectionResetError FileExistsError
    syn keyword pythonExClass	FileNotFoundError InterruptedError
    syn keyword pythonExClass	IsADirectoryError NotADirectoryError
    syn keyword pythonExClass	PermissionError ProcessLookupError TimeoutError

    syn keyword pythonExClass	ResourceWarning
  endif
  syn keyword pythonExClass	BaseException
  syn keyword pythonExClass	Exception ArithmeticError
  syn keyword pythonExClass	LookupError EnvironmentError

  syn keyword pythonExClass	AssertionError AttributeError BufferError EOFError
  syn keyword pythonExClass	FloatingPointError GeneratorExit IOError
  syn keyword pythonExClass	ImportError IndexError KeyError
  syn keyword pythonExClass	KeyboardInterrupt MemoryError NameError
  syn keyword pythonExClass	NotImplementedError OSError OverflowError
  syn keyword pythonExClass	ReferenceError RuntimeError StopIteration
  syn keyword pythonExClass	SyntaxError IndentationError TabError
  syn keyword pythonExClass	SystemError SystemExit TypeError
  syn keyword pythonExClass	UnboundLocalError UnicodeError
  syn keyword pythonExClass	UnicodeEncodeError UnicodeDecodeError
  syn keyword pythonExClass	UnicodeTranslateError ValueError VMSError
  syn keyword pythonExClass	WindowsError ZeroDivisionError

  syn keyword pythonExClass	Warning UserWarning BytesWarning DeprecationWarning
  syn keyword pythonExClass	PendingDepricationWarning SyntaxWarning
  syn keyword pythonExClass	RuntimeWarning FutureWarning
  syn keyword pythonExClass	ImportWarning UnicodeWarning
endif

if s:Enabled("g:python_slow_sync")
  syn sync minlines=2000
else
  " This is fast but code inside triple quoted strings screws it up. It
  " is impossible to fix because the only way to know if you are inside a
  " triple quoted string is to start from the beginning of the file.
  syn sync match pythonSync grouphere NONE "):$"
  syn sync maxlines=200
endif

if version >= 508 || !exists("did_python_syn_inits")
  if version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pythonStatement        Statement
  HiLink pythonImport           Include
  HiLink pythonFunction         Function
  HiLink pythonConditional      Conditional
  HiLink pythonRepeat           Repeat
  HiLink pythonException        Exception
  HiLink pythonOperator         Operator

  HiLink pythonDecorator        Define
  HiLink pythonDottedName       Function
  HiLink pythonDot              Normal

  HiLink pythonComment          Comment
  if !s:Enabled("g:python_highlight_file_headers_as_comments")
    HiLink pythonCoding           Special
    HiLink pythonRun              Special
  endif
  HiLink pythonTodo             Todo

  HiLink pythonError            Error
  HiLink pythonIndentError      Error
  HiLink pythonSpaceError       Error

  HiLink pythonString           String
  HiLink pythonRawString        String

  HiLink pythonUniEscape        Special
  HiLink pythonUniEscapeError   Error

  if s:Python2Syntax()
    HiLink pythonUniString          String
    HiLink pythonUniRawString       String
    HiLink pythonUniRawEscape       Special
    HiLink pythonUniRawEscapeError  Error
  else
    HiLink pythonBytes              String
    HiLink pythonRawBytes           String
    HiLink pythonBytesContent       String
    HiLink pythonBytesError         Error
    HiLink pythonBytesEscape        Special
    HiLink pythonBytesEscapeError   Error
  endif

  HiLink pythonStrFormatting    Special
  HiLink pythonStrFormat        Special
  HiLink pythonStrTemplate      Special

  HiLink pythonDocTest          Special
  HiLink pythonDocTest2         Special

  HiLink pythonNumber           Number
  HiLink pythonHexNumber        Number
  HiLink pythonOctNumber        Number
  HiLink pythonBinNumber        Number
  HiLink pythonFloat            Float
  HiLink pythonNumberError      Error
  HiLink pythonOctError         Error
  HiLink pythonHexError         Error
  HiLink pythonBinError         Error

  HiLink pythonBoolean          Boolean

  HiLink pythonBuiltinObj       Structure
  HiLink pythonBuiltinFunc      Function

  HiLink pythonExClass          Structure

  delcommand HiLink
endif

let b:current_syntax = "python"

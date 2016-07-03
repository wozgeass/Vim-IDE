" Vim plugin to fit the Linux kernel coding style and help kernel development
" Adding colors for functions, macros an data types of linux kernel
" Last Change:  2016 Mayo 13
" Maintainer:   Adrian Perez Dominguez <adrian@aztli.org>
" License:      Distributed under the same terms as Vim itself.
"
" This script is inspired from an article written by Bart:
" http://www.jukie.net/bart/blog/vim-and-linux-coding-style
" and adapted from Linux kernel Coding style to expand his fuctionalities.
" Vivien Didelot <vivien.didelot@savoirfairelinux.com>
" and various user comments.

if exists("g:loaded_linuxsty")
    finish
endif
let g:loaded_linuxsty = 1

set wildignore+=*.ko,*.mod.c,*.order,modules.builtin

augroup linuxsty
    autocmd!

    autocmd FileType c,cpp call s:LinuxFormatting()
    autocmd FileType c,cpp call s:LinuxKeywords()
    autocmd FileType c,cpp call s:LinuxHighlighting()
    autocmd FileType diff,kconfig setlocal tabstop=8
augroup END

function s:LinuxFormatting()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
    setlocal textwidth=80
    setlocal noexpandtab

    setlocal cindent
    setlocal formatoptions=tcqlron
    setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function s:LinuxKeywords()
	" Incluimos varios elementos usados para desarrollar en linux.
    syn keyword cOperator likely unlikely
    syn keyword cDefine prueba1
	syn keyword cFunction prueba2
    " Constantes para inotify API
	syn keyword cConstant IN_ACCESS IN_ATTRIB IN_CLOSE_WRITE IN_CLOSE_NOWRITE 
    syn keyword cConstant IN_CREATE IN_DELETE IN_DELETE_SELF IN_MODIFY IN_MOVE_SELF 
    syn keyword cConstant IN_MOVED_FROM IN_MOVED_TO IN_OPEN IN_MOVE IN_CLOSE IN_DONT_FOLLOW
    syn keyword cConstant IN_EXCL_UNLINK IN_MASK_ADD IN_ONESHOT IN_ONLYDIR IN_IGNORED
    syn keyword cConstant IN_ISDIR IN_Q_OVERFLOW IN_UNMOUNT
	syn keyword CstorageClass __init __exit __initdata __initconst __exitdata __exit_call 
	syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
endfunction

function s:LinuxHighlighting()
    highlight default link LinuxError ErrorMsg

    syn match LinuxError / \+\ze\t/     " spaces before tab
    syn match LinuxError /\s\+$/        " trailing whitespaces
    syn match LinuxError /\%81v.\+/     " virtual column 81 and more
endfunction

" vim: ts=4 et sw=4

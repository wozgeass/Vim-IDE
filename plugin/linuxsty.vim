" Vim plugin to fit the Linux kernel coding style and help kernel development
" Adding colors for functions, macros an data types of linux kernel
" Last Change:  2015 Aug 20
" Maintainer:   Adrian Perez Dominguez <vivien.didelot@savoirfairelinux.com>
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
	"
    syn keyword cOperator likely unlikely
    syn keyword cDefine prueba1
	syn keyword cFunction prueba2
	syn keyword cConstant prueba3
	syn keyword CstorageClass __init __exit __initdata __initconst __exitdata __exit_call 
	syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64 adrian
endfunction

function s:LinuxHighlighting()
    highlight default link LinuxError ErrorMsg

    syn match LinuxError / \+\ze\t/     " spaces before tab
    syn match LinuxError /\s\+$/        " trailing whitespaces
    syn match LinuxError /\%81v.\+/     " virtual column 81 and more
endfunction

" vim: ts=4 et sw=4

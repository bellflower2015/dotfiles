"dein Scripts-----------------------------
if &compatible
    set nocompatible " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

if filereadable(expand('~/.vimrc.dein'))
    source ~/.vimrc.dein
endif

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------

syntax enable

runtime! conf.d/.vimrc.*
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set number

"syntax enable
"set background=dark
"colorscheme solarized

syntax enable
set background=light
"colorscheme solarized

if has('gui_running')
"   set guifont=Consolas:h20:b:cDEFAULT
	set guifont=Droid_Sans_Mono:h18:b:cDEFAULT
endif

"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

filetype plugin indent on

" оригинальные репозитории на github

Bundle 'klen/python-mode'
Bundle 'gmarik/vundle'


"========================================================================
" My .		vimrc
" URL:		https://github.com/moshushi/vimconf.git
"========================================================================
" Sections:
" -> General
" -> VIM user interface
" -> Colors and Fonts
" -> Text, tab and indent related
" -> Status line
" -> Vundle setup
" -> My Bundles list
" -> Plugin configuration
" -> Auto commands
"========================================================================

"========================================================================
" => General
"========================================================================

" Interface
set nocompatible " be iMproved

" Use system clipboard
set clipboard=unnamed

" Reload .vimrc in Vim without restarting vim
:au! BufWritePost $MYVIMRC source $MYVIMRC

" Set filetype stuff to on
filetype off "required for vundle
filetype plugin on
filetype indent on

" Automatically read a file that has changed on disk
set autoread

"========================================================================
" => VIM user interface
"========================================================================

" Show number string
set number

" Make command line two lines high
set ch=2

" Turn on the WiLd menu
set wildmenu

" set visual bell
set vb

"========================================================================
" => Colors and Fonts
"========================================================================

" Switch on syntax highlighting
syntax enable

" Set cursor line backlighting
set cursorline

" Set colorscheme blue for WindowsPowerShell and desert for anyothers
if !has ('gui_running') && has ('win32')
    colorscheme blue
    else
    colorscheme desert
endif

" Set extra options when running in GUI mode
if has ('gui_running')
  " disable grafic icons 
  set guioptions-=T
  set t_Co=256
endif

"set encoding=utf8
if has ('win32')
    set encoding=cp1251
    "set encoding=utf8
else 
    set encoding=utf8
endif

set fileformat=unix
set fencs=utf-8,cp1521,koi8-r,cp866

if has ('win32')
    set guifont=Droid_Sans_Mono:h18:b:cDEFAULT
else
   " for gui Linux
   set guifont=Terminus\ 10
endif

"========================================================================
" => Text, tab and indent related
"========================================================================

" Switch input languages
set keymap=russian-jcukenwin " <C-^>
set iminsert=0 " default English layout
set imsearch=0 " for search and input too

" Hide the mouse pointer while typing
set mousehide

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

"Auto indent
set ai

"Smart indent
set si

"Wrap lines
set wrap

"========================================================================
" => Status line
"========================================================================

" Status line
set laststatus=2

" Disable ruler
set noruler

"Format the status line
"

"========================================================================
" => Vundle setup 
"========================================================================

filetype off " required!

 " Vundle on Windows
 " cd %USERPROFILE%
 " git clone https://github.com/gmarik/vundle.git vimfiles/bundle/vundle
 " Requirements: Git and Curl, openSSL

if has ('win32')
    set rtp+=$HOME/vimfiles/bundle/vundle/
    call vundle#rc('$HOME/vimfiles/bundle/')
else
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"========================================================================
" => My Bundles list
"========================================================================

"original repos on github
" Python/Django
Bundle 'klen/python-mode'

"Colorschemes
Bundle 'altercation/vim-colors-solarized'
" Bundle 'desert-warm-256'

" vim-scripts repos
" Bundle 'L9'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!

 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed.

"========================================================================
" => Plugin configuration
"========================================================================

"" solarized
"colorscheme solarized 
" if has('gui_running')
"	set background=light
"else
"	set background=dark
"endif


"let g:pymode_run_key='RR'
"let g:pymode_run_key='<leader>r'
"The default leader is '\\', but many people prefer ',' as it's in a standard
"location
let mapleader = ','

"Customize python-mode
let g:pymode_options = 0
let g:pymode_lint_write = 0 "не проверять при каждом сохранении
let g:pymode_folding = 0 "мне не нужен авто-фолдинг
let g:pymode_rope_vim_completion = 0 "не использовать автодополнение rope
map <F3> :PyLint <CR>

"========================================================================
" => Auto commands
"========================================================================

"function! MyKeyMapHighlight()
"   if &iminsert == 0 " при английской раскладке статусная строка текуего окна будет серого цвета
"      hi StatusLine ctermfg=White guifg=White
"   else " а при русской - зеленого.
"      hi StatusLine ctermfg=DarkRed guifg=DarkRed
"   endif
"endfunction
"call MyKeyMapHighlight() " при старте Vim устанавливать цвет статусной строки
"autocmd WinEnter * :call MyKeyMapHighlight() " при смене окна обновлять информациі о раскладках

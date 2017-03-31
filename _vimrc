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
" -> Mapping keys
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

" Menu character encoding (utf8, cp1251, koi8-r, cp866)
menu Encoding.utf-8 :e++enc=utf8<CR>
menu Encoding.windows-1251 :e++enc=cp1251<CR>
menu Encoding.koi8-r :e++enc=koi8-r<CR>
menu Encoding.cp866 :e++enc=cp866<CR>


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

set encoding=utf8

set fileformat=unix
set fileencodings=utf-8,cp1251
set fencs=utf-8,cp1521,koi8-r,cp866
set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255

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
highlight lCursor guifg=NONE guibg=Cyan

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
"set si    " set smartindent
"inoremap # X^H#

"Cindent    enable specific indenting for C code
set cin " set cindent


"Wrap lines
set wrap

"Enable folding
"set nofoldenable "set nofen or set fen
""set nofen
set foldmethod=indent
set foldlevel=99
"au WinEnter * set nofen
"au WinLeave * set nofen

"Сворачивание по отступам
"sef foldmethod=indent

"Автоматическое переключение рабочей папки
set autochdir

"========================================================================
" => Status line
"========================================================================

" Status line
set laststatus=2

if has("statusline")
    set statusline=%f\ %m\ %{&fileencoding?&fileencoding:&encoding}
endif

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
Bundle 'vim-scripts/Efficient-python-folding'

" vim-ipython
"Bundle 'ivanov/vim-ipython'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!

 "
 " Brief help
 " :BundleList          - l:st configured bundles
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


"Customize python-mode
let mapleader = ','
let g:pymode_run_key = '<leader>r' " key for run python code

"Pylint checking
let g:pymode_lint = 0 " disable pylint checking every save
nnoremap <leader>p :PymodeLint<cr> "pressing ,p will run plyint on current buffer

map <F3> :PymodeLint <CR>
map <F5> :w\|!python %<cr>
imap <F5> <Esc><F5>


"========================================================================
" => Auto commands
"========================================================================

" comment code
vnoremap <silent> # :s#^#\# #<cr>:noh<cr>
vnoremap <silent> -# :s#^\# ##<cr>:noh<cr>

" Some try folding
"g:vim_markdown_folding_disabled=1
"let g:pymode_folding = 0

"========================================================================

if ($OS =~ "Windows")
	"set nocp                    " 'compatible' is not set
	filetype plugin on          " plugins are enabled
    colorscheme solarized
    set background=light
    set guifont=Consolas:h18::cDEFAULT
    "set guifont=Droid_Sans_Mono:h18:b:cDEFAULT
    "NetrwSettings
    let g:netrw_cygwin= 0
    let g:netrw_silent = 1
    let g:netrw_ssh_cmd = 'plink.exe -C -load ub -batch -T -ssh'
    let g:netrw_scp_cmd = 'pscp.exe -C -load ub -batch -q -scp'
    let g:netrw_list_cmd = 'plink.exe -C -load ub ls -Fa'
    let g:netrw_banner = 0
    ab ub e scp://lis@ubu:22022//home/lis
endif

"========================================================================
" => Mapping keys
"========================================================================

" quickly edit vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>

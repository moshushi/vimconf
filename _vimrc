"========================================================================
" My .		vimrc
" URL:		https://github.com/moshushi/vimconf.git
"========================================================================


" Interface
set nocompatible " be iMproved
set number
syntax enable

" Status line
set laststatus=2
"hi StatusLine guibg=red
"hi StatusLine ctermbg=3 ctermfg=4
"hi StatusLine guibg=black
"hi StatusLine gui=reverse cterm=reverse

set clipboard=unnamed
set visualbell

"��������� ������ � �������
"��������� ��������� (���������) �� ��������� (��� �������� ��� ����� ���������� � ���� ���������)
if has('win32')
   set encoding=cp1251
else
   set encoding=utf-8
   set termencoding=utf-8
endif
" ������ ����� �� ��������� (������ �� ��������� �����) - ����� ������������ � ��������� �������
set fileformat=unix
" �������� ��������� ����� �� ��������� (��� ����� �� ��������� ����������� � ���� ���������)
set fencs=utf-8,cp1251,koi8-r,cp866

if has('gui')
    " ��������� ����������� ���� (��������� ���������,
    " �������� ������ ����� �� ������)
    set guioptions-=e
    " ��������� ����� ������ � ���� GUI (����, ��������� � �.�.)
    set guioptions-=T
"        set guifont=Lucida_Console:h10:cRUSSIAN::
	set guifont=Droid_Sans_Mono:h18:b:cDEFAULT
    else
        set guifont=Terminus\ 10
endif

"��������� ������������ ��������� ����������
"������� ���������
set keymap=russian-jcukenwin " ����������� ������������ ��������� ���������� �� <C-^>
set iminsert=0 " ��������� �� ��������� - ����������
set imsearch=0 " ���������� ��� ������ ������ � ����� ������


" Vundle setup
"Vundle on Windows
"cd %USERPROFILE%
" git clone https://github.com/gmarik/vundle.git %USERPROFILE%/vimfiles/bundle/vundle

filetype off " required!

" Usual quickstart instructions
if has('win32') || has('win64')
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
" My Bundles list here:
"========================================================================

" original repos on github
" Python/Django
Bundle 'klen/python-mode'

" Colorschemes
Bundle 'altercation/vim-colors-solarized'
"Bundle 'git://github.com/trapd00r/neverland-vim-theme.git'
"Bundle 'git://github.com/sickill/vim-monokai.git'
"Bundle 'git://github.com/tomasr/molokai.git'

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
"Plugin configuration
"========================================================================
colorscheme solarized 
 if has('gui_running')
	set background=light
else
	set background=dark
endif

"let g:pymode_run_key='RR'
"let g:pymode_run_key='<leader>r'
"The default leader is '\\', but many people prefer ',' as it's in a standard
"location
let mapleader = ','

"Customize python-mode
let g:pymode_options = 0
let g:pymode_lint_write = 0 "�� ��������� ��� ������ ����������
let g:pymode_folding = 0 "��� �� ����� ����-�������
let g:pymode_rope_vim_completion = 0 "�� ������������ �������������� rope
map <F3> :PyLint <CR>

"========================================================================
" Auto commands
"========================================================================

" AutoReload .vimrc
" from http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
" Source the vimrc file after saving it
    if has("autocmd")
        autocmd! bufwritepost .vimrc source $MYVIMRC
    endif
    
function! MyKeyMapHighlight()
   if &iminsert == 0 " ��� ���������� ��������� ��������� ������ �������� ���� ����� ������ �����
      hi StatusLine ctermfg=White guifg=White
   else " � ��� ������� - ��������.
      hi StatusLine ctermfg=DarkRed guifg=DarkRed
   endif
endfunction
call MyKeyMapHighlight() " ��� ������ Vim ������������� ���� ��������� ������
autocmd WinEnter * :call MyKeyMapHighlight() " ��� ����� ���� ��������� ���������� � ����������

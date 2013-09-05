"��������� �������� ���� � ������� ��������� ���������
set nocompatible " be iMproved
set number
syntax enable
"set background=light
"colorscheme slate

"colorscheme zellner
"colorscheme solarized
set laststatus=2

"hi StatusLine guibg=red
"hi StatusLine ctermbg=3 ctermfg=4
"hi StatusLine guibg=black
"hi StatusLine gui=reverse cterm=reverse

set clipboard=unnamed
set visualbell

"if has('gui_running')
"   set guifont=Consolas:h20:b:cDEFAULT
"	set guifont=Droid_Sans_Mono:h18:b:cDEFAULT
"endif

"if has('win32')
   "let $VIMRUNTIME = $HOME.'\Programs\Vim\vim72'
   "source $VIMRUNTIME/mswin.vim
"else
   "let $VIMRUNTIME = $HOME.'/.vim'
"endif

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

    if has('win32') || has('win64')
"        set guifont=Lucida_Console:h10:cRUSSIAN::
	set guifont=Droid_Sans_Mono:h18:b:cDEFAULT
    else
        set guifont=Terminus\ 10
    endif
endif

"��������� ������������ ��������� ����������
set keymap=russian-jcukenwin " ����������� ������������ ��������� ���������� �� <C-^>
set iminsert=0 " ��������� �� ��������� - ����������
set imsearch=0 " ���������� ��� ������ ������ � ����� ������
function! MyKeyMapHighlight()
   if &iminsert == 0 " ��� ���������� ��������� ��������� ������ �������� ���� ����� ������ �����
      hi StatusLine ctermfg=White guifg=White
   else " � ��� ������� - ��������.
      hi StatusLine ctermfg=DarkRed guifg=DarkRed
   endif
endfunction
call MyKeyMapHighlight() " ��� ������ Vim ������������� ���� ��������� ������
autocmd WinEnter * :call MyKeyMapHighlight() " ��� ����� ���� ��������� ���������� � ����������

"Vundle on Windows
"cd %USERPROFILE%
" git clone https://github.com/gmarik/vundle.git %USERPROFILE%/vimfiles/bundle/vundle

filetype off " required!

if has('win32') || has('win64')
	"set rtp+=%USERPROFILE%/vimfiles/bundle/vundle/
	set rtp+=$HOME/vimfiles/bundle/vundle/
"	set trp+=~/vimfiles/bundle/vundle/
	call vundle#rc('$HOME/vimfiles/bundle/')
else
	"Usual quickstart instructions
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
endif

" let Vundle manage Vundle
 " required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'klen/python-mode'
Bundle 'klen/python-mode'
Bundle 'altercation/vim-colors-solarized'

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

colorscheme solarized 
 if has('gui_running')
	set background=light
else
	set background=dark
endif

"let g:pymode_run_key='RR'
"let g:pymode_run_key='<leader>r'

"��������� python-mode
let g:pymode_options = 0
let g:pymode_lint_write = 0 "�� ��������� ��� ������ ����������
let g:pymode_folding = 0 "��� �� ����� ����-�������
let g:pymode_rope_vim_completion = 0 "�� ������������ �������������� rope
map <F3> :PyLint <CR>

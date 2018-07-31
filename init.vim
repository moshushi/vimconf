" Neovim config file ~/.config/nvim/init.vim

" Reload init.vim in NeoVim without restarting NeoVim
:au! BufWritePost $MYVIMRC source $MYVIMRC

" VIM user interface {{{
set number                  " Set line numbers on
set ch=2                    " Make command line two lines high
set mousehide               " Hide the mouse pointer while typing
" set cursorline

" Show spez symbols
set list
set listchars=trail:∙,tab:=> "
" set listchars=eol:$,tab:=>,trail:~,space:∙
" }}}

" Text, tab and indent related {{{

" Switch input languages
set keymap=russian-jcukenwin " <C-^>
set iminsert=0              " default English layout
set imsearch=0              " for search and input too

" Begining line
set smarttab        " Use shiftwidth instead of tabstop at start of lines
set shiftwidth=2    " The anount to block indent when using < and >

" Tab are 4 spaces
set tabstop=4       " 4 space tab
set softtabstop=4   " Causes backspace to delete 4 spaces
set expandtab       " Replase a <TAB?> with spaces in Insert Mode

set clipboard=unnamedplus
let mapleader = ','
"}}}


" Plug sections {{{
" Automatic installation VIM-PLUG
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" comment
" Plug 'tomtom/tcomment_vim'

" indents
Plug 'Yggdroot/indentLine'

" comment
Plug 'tpope/vim-commentary'

" indents
" Plug 'nathanaelkane/vim-indent-guides'

" Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }

" Plug 'Valloric/YouCompleteMe', {'do': './install.py' }

" color breckets
"Plug 'luochen1990/rainbow'
Plug 'junegunn/rainbow_parentheses.vim'

"auto enter breckets
"Plug 'Raimondi/delimitMate'

" check syntaxis
"Plug 'scrooloose/syntastic'

" otstupy
"Plug 'nathanaelkane/vim-indent-guides'

"colorscheme
" Plug 'frankier/neovim-colors-solarized-truecolor-only'
" set termguicolors
" set background=light " or dark

" Initialize plugin system
call plug#end()
" }}}

" source ./rainbow.vim

"let g:rbpt_loadcmd_toggle=1
"au VimEnter * RainbowParentheses
"au Syntax * RainbowParentheses

noremap <silent> <Leader>cc :Tcomment<CR>


" indentline config
if exists("g:indentLine_enabled")
  let g:indentLine_char = '┆'         " ^Vu2506
  let g:indentLine_color_term = 239
endif

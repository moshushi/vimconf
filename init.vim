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
Plug 'tpope/vim-commentary'

" indents
Plug 'Yggdroot/indentLine'

" color breckets
Plug 'junegunn/rainbow_parentheses.vim'

" surround
Plug 'tpope/vim-surround'

" repeat forsurround
Plug 'tpope/vim-repeat'

" status line
Plug 'itchyny/lightline.vim'

" Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }

" Plug 'Valloric/YouCompleteMe', {'do': './install.py' }


"auto enter breckets
"Plug 'Raimondi/delimitMate'

" check syntaxis
"Plug 'scrooloose/syntastic'

"colorscheme
Plug 'frankier/neovim-colors-solarized-truecolor-only'
" set termguicolors
" set background=light " or dark

Plug 'tomasr/molokai'
Plug 'trevordmiller/nova-vim'
Plug 'sickill/vim-monokai'
Plug 'ewilazarus/preto'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()
" }}}

" source ./rainbow.vim

"let g:rbpt_loadcmd_toggle=1
au VimEnter * RainbowParentheses
au Syntax * RainbowParentheses


" let g:indentLine_char = '┆'         " ^Vu2506

" indentline config
" if exists('g:indentLine_enabled')
" if exists(':IndentLinesToggle')
  let g:indentLine_char = '┆'         " ^Vu2506
  let g:indentLine_color_term = 239
  " echo "hi"
" endif

" if has('gui_running')
"   colorscheme nova
" endif

" highlight LineNr guibg="#556873"
" colorscheme molokai

" colorscheme nova
" highlight LineNr guibg=#556873

" if colorscheme == 'solarized'
colorscheme solarized
set termguicolors
set background=dark " or dark
" set background=light " or dark
" endif
" {rtp}/autoload/has.vim
" function! has#colorscheme(name)
"     pat = 'colors/'.a:name.'.vim'
"     return !empty(globpath(&rtp, pat))
" endfunction

" " .vimrc
" if has#colorscheme('solarized')
"   set termguicolors
" endif

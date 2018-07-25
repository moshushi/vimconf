" Neovim config file ~/.config/nvim/init.vim

set nu

" Automatic installation VIM-PLUG
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }

" Plug 'Valloric/YouCompleteMe', {'do': './install.py' }

" color breckets
Plug 'luochen1990/rainbow'

"auto enter breckets
"Plug 'Raimondi/delimitMate'

" check syntaxis
Plug 'scrooloose/syntastic'

" otstupy
Plug 'nathanaelkane/vim-indent-guides'

"colorscheme
" Plug 'frankier/neovim-colors-solarized-truecolor-only'
" set termguicolors
" set background=light " or dark

" Initialize plugin system
call plug#end()


" source ./rainbow.vim

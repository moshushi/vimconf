" Neovim config file ~/.config/nvim/init.vim

" Reload init.vim in NeoVim without restarting NeoVim
:au! BufWritePost $MYVIMRC source $MYVIMRC

" VIM user interface {{{
set number                  " Set line numbers on
set ch=2                    " Make command line two lines high
set mousehide               " Hide the mouse pointer while typing
set cursorline              " Show cursor line

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

" Filetype plugins
filetype plugin indent on
autocmd filetype python set expandtab

set clipboard=unnamedplus
"}}}

" Change vim behavior {{{
set hidden
" set timeoutlen = 400
" au FocusLost * :wa      " Save on losing focus - check is it work?
" }}}

" Usefull mapping {{{
nnoremap ; :
" inoremap sss <ESC>       " Quicker Escaping

" Quickly edit the vimrc file
let mapleader = ','
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>ew <C-w><C-v><C-l>:e $MYVIMRC<CR>     " Edit my src in vertical split window
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"}}}

cmap w!! w !sudo tee % >/dev/null   " Write file uses sudo

" Enable python providers
let g:python_host_prog = '/home/lis/.virtualenvs/neovim2/bin/python'
let g:python3_host_prog = '/home/lis/.virtualenvs/neovim3/bin/python'


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

" repeat for surround
Plug 'tpope/vim-repeat'

" status line
Plug 'itchyny/lightline.vim'

Plug 'neomake/neomake'
" {{{
  " let g:neomake_python_enabled_makers = ['flake8', 'pep8']
  " let g:neomake_python_flake8_maker = { 'args': ['--ignore=E115,E266,E501'], }
  " let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=100', '--ignore=E115,E266'], }
" }}}

Plug 'plytophogy/vim-virtualenv'

Plug 'chase/vim-ansible-yaml'

" Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }

" Plug 'Valloric/YouCompleteMe', {'do': './install.py' }


"auto enter breckets
"Plug 'Raimondi/delimitMate'

" Plug 'python-mode/python-mode'

"colorscheme
Plug 'frankier/neovim-colors-solarized-truecolor-only'
" set termguicolors
" set background=light " or dark

Plug 'tomasr/molokai'
Plug 'trevordmiller/nova-vim'
Plug 'sickill/vim-monokai'
Plug 'ewilazarus/preto'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Initialize plugin system
call plug#end()
" }}}


" Plugins config sections {{{
"let g:rbpt_loadcmd_toggle=1
"
au VimEnter * RainbowParentheses
au Syntax * RainbowParentheses

let g:indentLine_char = '┆'         " ^Vu2506
let g:indentLine_color_term = 239
" }}}

" config Neomake
let g:neomake_open_list = 2
nmap <leader>r :NeomakeSh python3 % <CR>

" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)

let g:neomake_python_py3_maker = {
      \ 'exe': '/usr/bin/python3',
      \ 'errorformat': '%A%f: line %l\, col %v\ (%t%*\d\)',
      \}
      " \ 'errorformat': '%A%f: line %l\, col %v\ (%t%*\d\)',
      " \'errorformat': '% C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m',

" highlight LineNr guibg="#556873"
" colorscheme molokai

" colorscheme nova
" highlight LineNr guibg=#556873

" if colorscheme == 'solarized'
colorscheme solarized
set termguicolors
set background=dark " or dark


" autocmd! FileType python nmap ,r :!clear; python3 %<CR>
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
:let g:asyncrun_open = 8


"Customize python-mode
" let mapleader = ','
" let g:pymode_run_key = '<leader>r' " key for run python code
"
nmap <leader>p :Neomake py3 <CR> :lopen <CR>






" Function  section {{{
function! SaveAndExecutePython()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction

" Bind F5 to save file if modified and execute python script in a buffer.
nnoremap <silent> <F5> :call SaveAndExecutePython()<CR>
vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>
" }}}

" echo "(>^.^<)"

filetype plugin on 
set nocompatible
set clipboard=unnamedplus
set number
syntax enable
set listchars=tab:\ \ ,trail:·,eol:\ \,nbsp:_
set list
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

filetype plugin on
call plug#begin()
Plug 'junegun/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'
call plug#end()

map <c-p> :FZF<cr>
map <c-k> :NERDTree<cr>
let mapleader = "\<space>"
noremap <leader><space> :w<cr>
nnoremap <C-c> :q!<cr>

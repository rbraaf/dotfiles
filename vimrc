" ========================================= "
" vimrc mappings, plugins and configuration "
" author: Ray Braaf                         "
" github: https://github.com/rbraaf         "
" ========================================= "


" ============================ "
" Vundle related configuration "
" ============================ "

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-rails'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'mileszs/ack.vim'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
filetype plugin indent on

" ============================ "
" Vim related configuration    "
" ============================ "

syntax on                                                " syntax highlighting
set number                                               " show line numbers
set laststatus=2                                         " always display the status line
set si                                                   " smart indent
let g:netrw_liststyle=3                                  " sets the list style for Netrw
set noshowmode                                           " remove mode from status line when using vim airline
set expandtab                                            " tabs are spaces
set tabstop=2                                            " number of visual spaces per TAB
set shiftwidth=2                                         " number of space characters inserted for indentation
set timeoutlen=1000                                      " used for mapping delays
set ttimeoutlen=0                                        " used for keycode delays
set incsearch                                            " searches characters as they are entered
set hlsearch                                             " highlight matches
set background=dark                                      " set background
colorscheme solarized                                    " set colorscheme
let g:solarized_termtrans = 1
set cursorline                                           " adds cursorline
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' " show line numbers in Netrw
set noswapfile                                           " Disable swapfile from creating
set wildmenu                                             " visual autocomplete for command menu
set ignorecase                                           " ignore case sensitivity when searching

" ============================ "
" Mappings                     "
" ============================ "
" set leader key
let mapleader = " "
" git blame mapping
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
nnoremap <Leader>w :w<CR>
" Open a new file
nnoremap <Leader>o :CtrlP<CR>
" Suspend Vim and Reopen
nnoremap <Leader>z <C-Z><CR>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-x> :nohl<CR><C-l>
" Switch panes
nnoremap <Leader>ss <C-W>w
" Open related file in split pane with <SPACE> rv
nmap <leader>rv :RV<CR>
" " Open related file in full pane with <SPACE> rr
nmap <leader>rr :R<CR>
" Clear trailing whitespace
nnoremap <Leader>rt :%s/\s\+$//e<CR>
" Open VIMRC file with <SPACE> vm
nmap <leader>vm :tabedit $MYVIMRC<CR>
" Go to related controller with leader c
nnoremap <leader>c :Econtroller<CR>
" Copy/paste without going to visual mode
nnoremap yp vyp<CR>
" Go to related model with leader m
nnoremap <leader>m :Emodel<CR>
" jk is escape
inoremap jk <esc>
" Easy access to the start of the line
nmap 0 ^
" Breakout into a new tab
nnoremap <Leader>bt <C-w>T
" Drop in Pry to debug. Leader bp
nmap <leader>bp obinding.pry<esc>^

" ============================ "
" Misc. configuration          "
" ============================ "

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

runtime macros/matchit.vim " Jump between method/class openings and closing tags with %

source ~/.vim/rspec " RSpec shortcut commands

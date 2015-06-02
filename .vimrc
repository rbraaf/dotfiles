set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'thoughtbot/vim-rspec'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on " syntax highlighting
set number " show line numbers
set laststatus=2
set si " smart indent
let g:netrw_liststyle=3 " sets the list style for Netrw
set noshowmode " remove mode from status line when using vim airline
set expandtab " tabs are spaces
set tabstop=2 " number of visual spaces per TAB
set shiftwidth=2 " number of space characters inserted for indentation
set timeoutlen=1000 " used for mapping delays
set ttimeoutlen=0 " used for keycode delays
set incsearch " searches characters as they are entered
set hlsearch " highlight matches
let g:solarized_termcolors = 256
set background=dark
colorscheme solarized
" let g:molokai_original = 1
set cursorline
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' "show line numbers in Netrw
set noswapfile
set wildmenu " visual autocomplete for command menu
let NERDTreeShowLineNumbers=1 " show line numbers in NERDTree
let g:airline_theme='powerlineish'
" For Preview
autocmd BufNewFile,BufRead \*.{md,mdwn,mkd,mkdn,mark\*} set filetype=markdown

" Mappings
let mapleader = " "
nmap <silent> <leader>d :NERDTreeToggle<CR>
" Git Blame mapping
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
nnoremap <Leader>w :w<CR>
" Open a new file
nnoremap <Leader>o :CtrlP<CR>
" Suspend Vim and Reopen
nnoremap <Leader>z <C-Z><CR>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Switch panes
nnoremap <Leader>ss <C-W>w
" Open related file in split pane with <SPACE> rv
nmap <leader>rv :RV<CR>
" " Open related file in full pane with <SPACE> rr
nmap <leader>rr :R<CR>


" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Pathogen
execute pathogen#infect()

runtime macros/matchit.vim " Jump between method/class openings and closing tags with %

source ~/.vim/rspec " RSpec shortcut commands

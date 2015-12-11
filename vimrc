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
Plugin 'mileszs/ack.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'tpope/vim-dispatch'
Plugin 'ggreer/the_silver_searcher'
Plugin 'rking/ag.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/nerdtree'

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
colorscheme brogrammer                                   " set colorscheme
let g:solarized_termtrans = 1
set cursorline                                           " adds cursorline
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' " show line numbers in Netrw
set noswapfile                                           " Disable swapfile from creating
set wildmenu                                             " visual autocomplete for command menu
set ignorecase                                           " ignore case sensitivity when searching
set smartcase
set list listchars=tab:»·,trail:·                        " Display extra whitespace
set backspace=2                                          " make backspace work like most other apps
let g:airline_theme="murmur"                             " vim airline theme
let g:airline_powerline_fonts = 1

" ============================ "
" THE SILVER SEARCHER          "
" ============================ "
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Ag.vim will always search from project root
let g:ag_working_path_mode="r"

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$\|.idea\|tags',
      \ 'file': '\.exe$\|\.so$\|\.dat$'
      \ }

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
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>
" Open a vim/tmux runner window
nnoremap <leader>osr :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>
" Vim tmux runner attach to pane
nnoremap <leader>va :VtrAttachToPane<cr>
" Send lines to runner - normal and visual mode
nmap <C-f> :VtrSendLineToRunner<cr>
vmap <C-f> <Esc>:VtrSendSelectedToRunner<cr>
" Send command to runner
nnoremap <leader>sc :VtrSendCommandToRunner<cr>
" Focus VTR runner
nnoremap <leader>fr :VtrFocusRunner<cr>
" Send file to runner
nnoremap <leader>sf :VtrSendFile<cr>

" ============================ "
" Misc. configuration          "
" ============================ "

" Automatically resize vim windows with tmux splits.
autocmd VimResized * :wincmd =

runtime macros/matchit.vim " Jump between method/class openings and closing tags with %

source ~/.vim/rspec " RSpec shortcut commands

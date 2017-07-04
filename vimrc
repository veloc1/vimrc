set nocompatible

call plug#begin('~\vimfiles\bundle')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-scripts/Wombat'

Plug 'vim-syntastic/syntastic'

Plug 'elixir-lang/vim-elixir'

call plug#end()

set encoding=utf-8
setlocal spell spelllang=ru_ru,en_us

autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set tw=80

colorscheme wombat

let g:airline_theme ='wombat'
let g:airline_powerline_fonts = 0
set guifont=Consolas:h10

source $VIMRUNTIME/delmenu.vim
set langmenu=ru_RU.UTF-8
source $VIMRUNTIME/menu.vim

syntax on
set number
set showcmd
set cursorline
set wildmenu

set showmatch

set incsearch
set hlsearch

filetype plugin on
filetype indent on

set sw=4
set tabstop=4
set softtabstop=4
set expandtab

set guioptions-=T
noremap <C-TAB> <C-W>w

autocmd VimEnter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

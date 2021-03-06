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

Plug 'whatyouhide/vim-gotham'

call plug#end()

set encoding=utf-8
setlocal spell spelllang=ru_ru,en_us

autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set tw=80

colorscheme gotham256

" let g:airline_theme ='wombat'
let g:airline_powerline_fonts = 0
set guifont=Consolas:h12

source $VIMRUNTIME/delmenu.vim
set langmenu=ru_RU.UTF-8
source $VIMRUNTIME/menu.vim

syntax on
set number
set showcmd
set cursorline
" Color column at 80
set colorcolumn =80
hi ColorColumn guibg=#0a1f2e
set wildmenu

set showmatch

set incsearch       " highlight search results
set hlsearch        " keep matches highlited

filetype plugin on
filetype indent on

set sw          =2
set tabstop     =2       
set softtabstop =2  " tab key extends to 2 spaces
set expandtab       " use spaces, not tabs

set guioptions-=T
noremap <C-TAB> <C-W>w

autocmd VimEnter * NERDTree
noremap <C-n> :NERDTreeToggle<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" temp files config
let path_to_temp = $HOME.'/.vim/files/'
if has("win32") 
  let path_to_temp = $HOME.'\vimfiles\files\'
endif
" create temp file
if !isdirectory(path_to_temp) && exists('*mkdir')
  call mkdir(path_to_temp)
  call mkdir(path_to_temp.'backup')
  call mkdir(path_to_temp.'swap')
  call mkdir(path_to_temp.'undo')
endif

" backup
set backup
let &backupdir    =path_to_temp.'backup/'
set backupext     =-vimbackup
set backupskip    =
" swap
let &directory    =path_to_temp.'swap//'
" undo
set undofile
let &undodir      =path_to_temp.'undo//'

" autocmd that reads last cursor position from this file and go to this
" position on file open
autocmd BufReadPost * 
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ execute "normal! g`\"" |
      \ endif

" Projects
function GoTo(project)
  if a:project=="Pozzt"
    cd C:\UserData\Work\Pozzt
  elseif a:project=="PozztApp"
    cd C:\UserData\Work\PozztApp
  else
    echo "No project found"
  endif
  NERDTreeCWD
endfunction
command -nargs=1 GoTo call GoTo('<args>')

" Todo list
command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw

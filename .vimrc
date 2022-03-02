set nocompatible
filetype off

" Plugin 'scrooloose/nerdcommenter'
" Plugin 'vim-python/python-syntax'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'lervag/vimtex'
" Plugin 'Townk/vim-autoclose'
" "Colorschemes
" Plugin 'tomasr/molokai'
" Plugin 'morhetz/gruvbox'
" Plugin 'jpo/vim-railscasts-theme'
" Plugin 'w0ng/vim-hybrid'
" " Plugin 'flazz/vim-colorschemes'
" " All of your Plugins must be added before the following line
" call vundle#end()            " required
" filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"prevents some security exploits having to do with modelines in files.
set modelines=0

"Everything 4 spaces!
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Make vim behave in a sane manner
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
"set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"set relativenumber
"Make undos persist through sessions
set undofile

"Remap Leader Key
"let mapleader = ","
" map leader to Space
let mapleader = " "
"Remap Esc woohoo
inoremap kj <Esc>
inoremap df <Esc>
"Remap C-e to jump at end of line in insert mode
inoremap <C-e> <C-o>A
"Fix search an replace
"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"Long Line Handling
set wrap
set textwidth=99
set formatoptions=qrn1
" set colorcolumn=80

"Show Whitespace characters
"set list
"set listchars=tab:▸\ ,eol:¬
set number
set clipboard=unnamed

"Learn vim the hard way
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"even less to type
nnoremap ; :

"Strip all trailing whitespace in current file!
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

map <C-p> :w<CR>:!python %<CR>

let g:python_highlight_all = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" SYNTASTIC

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'morhetz/gruvbox'
Plug 'pseewald/vim-anyfold'
Plug 'tpope/vim-surround'
call plug#end()

syntax enable
set background=dark
colorscheme gruvbox

map <C-o> :NERDTreeToggle<CR>
" remap to close the current buffer, but not vim
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
map <leader>s :w<CR>
map <leader>rc :source ~/.vimrc<CR>
" This calls fzf
map <leader>f :Files<CR>
" next buffer (cycles through open buffers)
map <leader><tab> :bn<CR>

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\}

let g:ale_fix_on_save = 1

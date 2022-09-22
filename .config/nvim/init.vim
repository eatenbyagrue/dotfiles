call plug#begin(stdpath('data') . '/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'dense-analysis/ale'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'morhetz/gruvbox'

call plug#end()

"colorscheme gruvbox

"Everything 4 spaces!
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

map <C-o> :NERDTreeToggle<CR>

let mapleader = " "
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


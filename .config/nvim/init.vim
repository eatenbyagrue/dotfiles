call plug#begin(stdpath('data') . '/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
    Plug 'preservim/nerdtree'
    Plug 'dense-analysis/ale'
    Plug 'morhetz/gruvbox'
    " Use 'gc' to comment out stuff
    Plug 'tpope/vim-commentary'
    " Use C-s in insert mode to autoclose
    Plug 'tpope/vim-surround'

call plug#end()

colorscheme gruvbox

"Everything 4 spaces!
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

map <C-o> :NERDTreeToggle<CR>
imap kj <ESC>
imap df <ESC>
map <leader>ww <C-w><C-w>
map <leader>vv <C-w><C-v>

autocmd FileType python map <buffer> <C-p> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <C-p> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

let mapleader = " "
" remap to close the current buffer, but not vim
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
map <leader>s :w<CR>
map <leader>rc :source ~/.config/nvim/init.vim<CR>
map <leader>rf :e ~/.config/nvim/init.vim<CR>
" This calls fzf
map <leader>f :Files<CR>
" next buffer (cycles through open buffers)
map <leader><tab> :bn<CR>

let b:ale_linters = {}
            " \    'python': ["flake8", "pylint"]
            "\ }
" let b:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'python': ['black'],
" \}
let g:ale_fix_on_save = 0

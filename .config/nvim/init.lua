-- Shorthand functions for mapping
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end


require('plugins')
require('lsp-config')
require('nvim-cmp')

local g = vim.g
local o = vim.opt

g.completion_enable_auto_popup = 1
g.mapleader = " "

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true
o.number = true

imap("df", "<ESC>")
nmap("<leader>ww", "<C-w><C-w>")
nmap("<leader>s", ":w<CR>")
nmap("<leader>rc", ":luafile ~/.config/nvim/init.lua<CR>")
nmap("<leader>rf", ":e ~/.config/nvim/init.lua<CR>")
nmap("<leader>q", ":q<CR>")
nmap("<leader><tab>", ":bn<CR>")
nmap("<leader>f", ":w <CR><bar>:!black %<CR>")

vim.keymap.set("n", "ge", function() 
    vim.diagnostic.setloclist()
end)

-- necessary for nvim-cmp
vim.cmd("set completeopt=menu,menuone,noselect")

vim.cmd("colorscheme gruvbox")
 
vim.cmd("autocmd FileType python map <buffer> <leader>s :w<CR><bar>:!black --line-length 79 %<CR>")
vim.cmd("autocmd FileType python map <buffer> <C-p> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>")
vim.cmd("autocmd FileType python imap <buffer> <C-p> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>")



-- Remap
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Settings

-- Use tab size 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4


vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

-- Move lines above and below
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- Window movement remap
vim.keymap.set('n', '<leader>sp', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-W>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-W>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-W>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-W>h', { noremap = true, silent = true })


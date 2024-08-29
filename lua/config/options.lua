vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"


-- clear serach history
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.cmd [[ set noswapfile ]]

-- Navigate to the next buffer
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })

-- Navigate to the previous buffer
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })


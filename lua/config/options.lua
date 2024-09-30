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


-- Use the 'fzf' command to show only filenames in the buffer list
vim.api.nvim_set_keymap('n', '<leader>b', ":Buffers<CR>", { noremap = true, silent = true })

-- Function to reload Neovim configuration
function _G.reload_config()
  vim.cmd('source ~/.config/nvim/init.lua')
  print("Configuration reloaded!")
end

-- Key mapping to reload configuration
vim.api.nvim_set_keymap('n', '<leader>l', [[:lua reload_config()<CR>]], { noremap = true, silent = true })

-- Key mapping to change directory and open init.lua
vim.api.nvim_set_keymap('n', '<leader>cd', ':cd ~/.config/nvim/lua/config<CR>:e options.lua<CR>', { noremap = true, silent = true })

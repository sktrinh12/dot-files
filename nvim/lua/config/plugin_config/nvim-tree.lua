vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- open new tree based on file
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

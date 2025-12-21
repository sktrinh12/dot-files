vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local devicons = require('nvim-web-devicons')
devicons.setup({
  override = {
    nf = {
      icon = "󰚄",
      color = "#04c19e",
      name = "Nextflow"
    }
  }
})

require("nvim-tree").setup({
 filters = {
    dotfiles = false,
    git_ignored = false,
  }
})

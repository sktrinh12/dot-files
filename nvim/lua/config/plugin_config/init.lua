require("config.plugin_config.gruvbox")
require("config.plugin_config.lualine")
require("config.plugin_config.nvim-tree")
require("config.plugin_config.treesitter")
require("config.plugin_config.fzf")
require("config.plugin_config.spelling")
require("config.plugin_config.format")
require('lspconfig').ts_ls.setup{}
require('lspconfig').bashls.setup{}
require('lspconfig').pyright.setup{}
require("config.plugin_config.cmp")

-- Ensure alpha-nvim is installed
require("lazy").setup({
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local startify = require("alpha.themes.startify")

    -- Set up the startify theme
    startify.file_icons.provider = "devicons"  -- Use devicons for file icons
    alpha.setup(startify.config)  -- Set up the startify theme

    -- Optional: You can customize the header, footer, etc.
    startify.section.header.val = {
      "Welcome to Neovim!",
      "Customized Start Screen"
    }
  end,
})

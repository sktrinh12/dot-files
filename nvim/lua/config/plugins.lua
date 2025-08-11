return {
 {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("config.plugin_config.nvim-tree")
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("config.plugin_config.treesitter")
    end
  },

  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      require("config.plugin_config.cmp")
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("config.plugin_config.lualine")
    end
  },

  {
    'stevearc/conform.nvim',
    config = function()
      require("config.plugin_config.format")
    end
  },

  'neovim/nvim-lspconfig',

  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gedit' }  -- Load on specific commands for lazy loading
  },

  {
    'junegunn/fzf',
    build = ':call fzf#install()' -- Automatically install fzf binary
  },
  -- fzf.vim (integration with fzf)
  'junegunn/fzf.vim',
  -- fzf-lua (an alternative fzf integration)
  {
    'ibhagwan/fzf-lua',
    config = function()
      require("config.plugin_config.fzf")
    end
  },

  {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require("alpha.themes.startify")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = "devicons"
      require("alpha").setup(
        startify.config
      )
    end,
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat" },
    config = function()
      require("config.plugin_config.codecompanion")
    end,
  },
  -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
  -- So for api plugins like devicons, we can always set lazy=true
  -- { "nvim-tree/nvim-web-devicons", lazy = true },

  -- you can use the VeryLazy event for things that can
  -- load later and are not important for the initial UI
  -- { "stevearc/dressing.nvim", event = "VeryLazy" },

  -- {
  --   "Wansmer/treesj",
  --   keys = {
  --     { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
  --   },
  --   opts = { use_default_keymaps = false, max_join_length = 150 },
  -- },

  -- {
    -- "monaqa/dial.nvim",
    -- lazy-load on keys
    -- mode is `n` by default. For more advanced options, check the section on key mappings
    -- keys = { "<C-a>", { "<C-x>", mode = "n" } },
  -- },

  -- local plugins need to be explicitly configured with dir
  -- { dir = "~/projects/secret.nvim" },

  -- you can use a custom url to fetch a plugin
  -- { url = "git@github.com:folke/noice.nvim.git" },

  -- local plugins can also be configured with the dev option.
  -- This will use {config.dev.path}/noice.nvim/ instead of fetching it from GitHub
  -- With the dev option, you can easily switch between the local and installed version of a plugin
  -- { "folke/noice.nvim", dev = true },
}

-- config/plugin_config/treesitter.lua
local ts = require('nvim-treesitter')

-- 1. Setup nvim-treesitter
ts.setup()

-- 2. Define the parsers you want, including 'markdown_inline'
local parsers = {
  "bash", "javascript", "typescript", "python", "sql", "groovy", "yaml",
  "markdown", "markdown_inline", "json"
}

-- 3. Filter out 'jsonc' to avoid the update error
parsers = vim.tbl_filter(function(lang) return lang ~= "jsonc" end, parsers)

-- 4. Install the parsers
ts.install(parsers)

-- 5. Register the 'json' parser for 'jsonc' filetypes
vim.treesitter.language.register("json", "jsonc")

-- 6. Enable Tree-sitter highlighting on the 'main' branch
-- The main branch requires you to explicitly start Tree-sitter for each buffer.
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

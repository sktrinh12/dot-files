-- FZF-LUA
vim.keymap.set("n", "<leader>f", require('fzf-lua').files, { desc = "Fzf Files" })
vim.keymap.set("n", "<leader>rg", require('fzf-lua').live_grep, { desc = "Fzf Grep" })
vim.keymap.set("n", "<leader>b", require('fzf-lua').buffers, { desc = "Fzf Buffers" })
vim.keymap.set("n", "<leader>r", require('fzf-lua').registers, { desc = "Fzf Registers" })

-- CONFORM FORMATTING
vim.keymap.set({ "n", "v" }, "<leader>m", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 60000,
  })
end, { desc = "Format file or range (in visual mode)" })

-- NERD-TREE
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- SPELLING
vim.keymap.set("n", "<leader>s", require("fzf-lua").spell_suggest, { desc = "Spelling Suggestions" })

-- LSP Diagnostics navigation
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic in float" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- intellisense
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })

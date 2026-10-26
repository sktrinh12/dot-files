-- FZF-LUA
vim.keymap.set("n", "<leader>f", function() require('fzf-lua').files() end, { desc = "Fzf Files" })
vim.keymap.set("n", "<leader>rg", function() require('fzf-lua').live_grep() end, { desc = "Fzf Grep" })
vim.keymap.set("n", "<leader>b", function() require('fzf-lua').buffers() end, { desc = "Fzf Buffers" })
vim.keymap.set("n", "<leader>r", function() require('fzf-lua').registers() end, { desc = "Fzf Registers" })

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
vim.keymap.set("n", "<leader>s", function() require("fzf-lua").spell_suggest() end, { desc = "Spelling Suggestions" })

-- LSP Diagnostics navigation
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic in float" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Intellisense
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })

-- Clear search history
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Navigate to buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>l', [[:lua _G.reload_config()<CR>]], { silent = true })

-- Key mapping to change directory and open options.lua
vim.keymap.set('n', '<leader>cd', ':cd $HOME/Documents/dot-files/nvim/lua/config<CR>:e options.lua<CR>', { silent = true })

-- Google Chrome browser open URL link
vim.keymap.set("n", "gx", [[:lua os.execute('google-chrome ' .. vim.fn.expand('<cfile>'))<CR>]], { silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

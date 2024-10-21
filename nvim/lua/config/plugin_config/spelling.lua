-- Enable spell checking for specific file types (markdown, html, text)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.cmd [[
  highlight SpellBad cterm=undercurl guifg=red guibg=NONE gui=undercurl 
]]

vim.keymap.set("n", "<leader>s", require("fzf-lua").spell_suggest, { desc = "Spelling Suggestions" })

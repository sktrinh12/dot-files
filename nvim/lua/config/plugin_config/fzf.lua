require('fzf-lua').setup({
  fzf_opts = { ["--wrap"] = true },
  winopts = {
    preview = {
      default = 'bat', 
      wrap = "wrap",
      layout = "horizontal",
      vertical = "down:45%",
      horizontal = "right:50%",
      flip_columns = 120,
    },
  },
  previewers = {
    bat = {
      cmd             = "batcat",
      args            = "--color=always --style=numbers,changes --line-range :200",
      theme           = 'tokyonight_night',
    },
  },
})

vim.keymap.set("n", "<leader>f", require('fzf-lua').files, { desc = "Fzf Files" })
vim.keymap.set("n", "<leader>rg", require('fzf-lua').live_grep, { desc = "Fzf Grep" })
vim.keymap.set("n", "<leader>b", require('fzf-lua').buffers, { desc = "Fzf Buffers" })
vim.keymap.set("n", "<leader>r", require('fzf-lua').registers, { desc = "Fzf Registers" })

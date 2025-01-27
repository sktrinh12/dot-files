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
      theme           = 'Catppuccin Mocha',
    },
  },
})

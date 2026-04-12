require('fzf-lua').setup({
  files = {
    -- This overrides the default command to include ignored files
    cmd = "rg --files --column --line-number --no-heading --color=always --smart-case --max-columns=4096 --e --hidden --no-ignore -g '!.git/'",
  },
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

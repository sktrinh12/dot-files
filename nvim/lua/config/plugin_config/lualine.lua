require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight-moon',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}

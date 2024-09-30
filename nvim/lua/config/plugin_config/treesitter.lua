require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "javascript", "typescript", "python"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

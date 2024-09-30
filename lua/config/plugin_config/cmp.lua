local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- For LuaSnip users
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),  -- Navigate to next item
    ['<C-p>'] = cmp.mapping.select_prev_item(),  -- Navigate to previous item
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),     -- Scroll documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
  },
  sources = {
    { name = 'nvim_lsp' },        -- LSP completion
    { name = 'nvim_treesitter' }, -- Treesitter completion
    { name = 'buffer' },          -- Buffer completion
    { name = 'path' },            -- Path completion
  },
})

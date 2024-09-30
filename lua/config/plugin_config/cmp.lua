local cmp = require('cmp')

local kind_icons = {
    Text = "🔤",
    Method = "🛠️",
    Function = "🔄",
    Constructor = "",
    Field = "",
    Variable = "⚙️",
    Class = "📚",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "🔍",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "🎨",
    File = "📄",
    Reference = "",
    Folder = "📁",
    EnumMember = "",
    Constant = "🔑",
    Struct = "",
    Event = "",
    Operator = "➕",
    TypeParameter = "",
}

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- For LuaSnip users
    end,
  },
  window = {
        completion = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),  -- Navigate to next item
    ['<C-p>'] = cmp.mapping.select_prev_item(),  -- Navigate to previous item
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),     -- Scroll documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
  },
  formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[NVIM_LUA]",
            nvim_treesitter = "[TREESITTER]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
  sources = {
    { name = 'nvim_lsp' },        -- LSP completion
    { name = 'nvim_treesitter' }, -- Treesitter completion
    { name = 'buffer' },          -- Buffer completion
    { name = 'path' },            -- Path completion
  },
})

local conform = require("conform")

local function sql_format()
  return {
    command = "python",
    args = { os.getenv("HOME") .. "/Documents/scripts/sql_format.py", "-" },
    stdin = true,
  }
end

local function ruff_format()
  return {
    command = "ruff",
    args = {
      "format",
      "--stdin-filename",
      vim.api.nvim_buf_get_name(0),
 },
    stdin = true,
  }
end

conform.setup({
formatters = {
    sqlparse = sql_format(),
    ruff = ruff_format(),
  },
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    sh = { "shfmt" },
    sql = { "sqlparse" },
    css = { "prettier" },
    scss = { "prettier" },
    python = { "ruff" },
    groovy = { "lsp" },
    },
})

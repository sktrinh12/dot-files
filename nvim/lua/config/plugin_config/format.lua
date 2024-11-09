local conform = require("conform")

local function sql_format()
  return {
    command = "python",
    args = { os.getenv("HOME") .. "/Documents/scripts/sql_format.py", "-" },
    stdin = true,
  }
end

conform.setup({
formatters = {
    sqlparse = sql_format(),
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
    python = { "black" },
    },
})

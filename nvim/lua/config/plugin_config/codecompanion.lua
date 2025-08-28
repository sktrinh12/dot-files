require("codecompanion").setup({
  adapters = {
    openrouter = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        env = {
          url = "https://openrouter.ai/api/v1",
          api_key = vim.env.OPENROUTER_API_KEY,
          chat_url = "/chat/completions",
        },
        url = "https://openrouter.ai/api/v1/chat/completions",
        schema = {
          model = { default = "deepseek/deepseek-r1-0528:free" },
        },
      })
    end,
  },
  strategies = {
    chat = { adapter = "openrouter" },
    inline = { adapter = "openrouter" },
  },
  opts = {
    log_level = "DEBUG",
  },
})

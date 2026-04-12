require("codecompanion").setup({
  adapters = {
    http = {
      openrouter = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "https://openrouter.ai/api",
            api_key = "OPENROUTER_API_KEY",
            chat_url = "/v1/chat/completions",
          },
          headers = {
            ["HTTP-Referer"] = "https://github.com/olimorris/codecompanion.nvim",
            ["X-Title"] = "codecompanion.nvim",
          },
          schema = {
            model = {
              default = "openrouter/free",
              choices = {
                -- Updated with current working free models
              "openrouter/free",
              "mistralai/devstral-2512:free",
              "meta-llama/llama-3.3-70b-instruct:free",
              "stepfun/step-3.5-flash:free",
              "arcee-ai/trinity-large-preview:free",
              "nvidia/nemotron-3-nano-30b-a3b:free",
              },
            },
          },
        })
      end,
    },
  },
  strategies = {
    chat = { adapter = "openrouter" },
    inline = { adapter = "openrouter" },
  },
  opts = {
    log_level = "DEBUG",
  },
})

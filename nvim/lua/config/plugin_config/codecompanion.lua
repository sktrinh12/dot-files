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
              default = "deepseek/deepseek-r1-0528:free",  -- Changed this
              choices = {
                -- Updated with current working free models
                "xiaomi/mimo-v2-flash:free",
                "mistralai/devstral-2512:free",
                "tngtech/deepseek-r1t2-chimera:free",
                "z-ai/glm-4.5-air:free",
                "deepseek/deepseek-r1-0528:free",
                "qwen/qwen3-coder:free",
                "meta-llama/llama-3.3-70b-instruct:free",
                "google/gemma-3-27b-it:free",
                "nvidia/nemotron-3-nano-30b-a3b:free",
                "openai/gpt-oss-120b:free",
                "google/gemini-2.0-flash-exp:free",
                "cognitivecomputations/dolphin-mistral-24b-venice-edition:free",
                "nousresearch/hermes-3-llama-3.1-405b:free",
                "openai/gpt-oss-20b:free",
              },
            },
          },
        })
      end,
    },
  },
  interactions = {
    chat = { adapter = "openrouter" },
    inline = { adapter = "openrouter" },
  },
  opts = {
    log_level = "DEBUG",
  },
})

require("codecompanion").setup({
  adapters = {
    openrouter = function()
      return require("codecompanion.adapters").extend("openai", {
        name = "openrouter",
        url = "https://openrouter.ai/api/v1/chat/completions",
        env = {
          api_key = vim.env.OPENROUTER_API_KEY,
        },
        headers = {
          ["HTTP-Referer"] = "https://github.com/olimorris/codecompanion.nvim",
          ["X-Title"] = "codecompanion.nvim",
        },
        schema = {
          model = { 
            default = "deepseek/deepseek-r1-0528:free", 
            choices = {
                "google/gemini-2.5-flash-image-preview:free",
                "deepseek/deepseek-r1:free",
                "openai/gpt-oss-120b:free",
                "z-ai/glm-4.5-air:free",
                "qwen/qwen3-235b-a22b:free",
                "moonshotai/kimi-dev-72b:free",
                "cognitivecomputations/dolphin-mistral-24b-venice-edition:free",
                "tencent/hunyuan-a13b-instruct:free",
                "tngtech/deepseek-r1t2-chimera:free",
                "mistralai/mistral-nemo:free",
                "meta-llama/llama-4-maverick:free",
                "nvidia/llama-3.1-nemotron-ultra-253b-v1:free",
                "shisa-ai/shisa-v2-llama3.3-70b:free",
                "rekaai/reka-flash-3:free",
                "nousresearch/deephermes-3-llama-3-8b-preview:free",
                "agentica-org/deepcoder-14b-preview:free",
                "sarvamai/sarvam-m:free"
              },
          },
        },
      })
    end,
  },
  strategies = {
      chat = {
        adapter = "openrouter",
        model = "deepseek/deepseek-r1:free",
      },
      inline = {
        adapter = "openrouter",
        model = "mistralai/mistral-7b-instruct:free",
      },
      agent = {
        adapter = "openrouter",
      },
  },
  opts = {
    log_level = "DEBUG",
  },
})

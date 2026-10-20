require("codecompanion").setup({
  adapters = {
    http = {
      openrouter = function()
        return require("codecompanion.adapters").extend("openrouter", {
          schema = {
            model = {
              default = "deepseek/deepseek-chat", -- Primary low-cost workhorse (~$0.27/1M input)
              choices = {
                "deepseek/deepseek-chat",             -- DeepSeek V3/V4 (Fast & extremely cheap)
                "deepseek/deepseek-r1",               -- DeepSeek R1 (For complex logic / heavy math)
                "qwen/qwen-2.5-coder-32b-instruct",  -- Excellent code-specific model
                "anthropic/claude-3.5-haiku",         -- Fast, budget-friendly option from Anthropic
                "google/gemini-2.5-flash",            -- Lightning fast with huge context
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
    cmd = { adapter = "openrouter" },
  },
  opts = {
    log_level = "ERROR", -- Changed from DEBUG to avoid massive log files during editing
  },
})

require("codecompanion").setup({
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "GEMINI_API_KEY",
        },
      })
    end,
    mistral = function()
      return require("codecompanion.adapters").extend("mistral", {
        env = {
          api_key = "MISTRAL_API_KEY",
        },
      })
    end,
  },
  strategies = {
    chat = { adapter = "mistral" },
    inline = { adapter = "gemini" },
  },
  opts = {
    log_level = "DEBUG",
  },
})

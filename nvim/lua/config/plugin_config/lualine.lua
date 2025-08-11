local Spinner = require('lualine.component'):extend()

function Spinner:init(options)
  Spinner.super.init(self, options)

  self.processing = false
  self.spinner_index = 1
  self.spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  self.spinner_symbols_len = #self.spinner_symbols

  local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

  vim.api.nvim_create_autocmd("User", {
    pattern = "CodeCompanionRequest*",
    group = group,
    callback = function(request)
      if request.match == "CodeCompanionRequestStarted" then
        self.processing = true
      elseif request.match == "CodeCompanionRequestFinished" then
        self.processing = false
      end
      vim.cmd("redrawstatus")
    end,
  })
end

function Spinner:update_status()
  if self.processing then
    self.spinner_index = (self.spinner_index % self.spinner_symbols_len) + 1
    return self.spinner_symbols[self.spinner_index]
  end
  return ""
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight-moon',
    refresh = {
      statusline = 100, -- refresh every 100ms for smooth spinner
    }
  },
  sections = {
    lualine_a = {
      { 'filename', path = 1 }
    },
    lualine_x = {
      Spinner,
    }
  }
}

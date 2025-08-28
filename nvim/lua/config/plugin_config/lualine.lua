local Spinner = require('lualine.component'):extend()

local function safe_buf_get_chat(bufnr)
  local ok, cc = pcall(require, "codecompanion")
  if not ok then return nil end
  local status, chat = pcall(cc.buf_get_chat, bufnr)
  if not status then
    return nil
  end
  return chat
end

function Spinner:init(options)
  Spinner.super.init(self, options)

  self.processing = false
  self.spinner_index = 1
  self.spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  self.spinner_symbols_len = #self.spinner_symbols
  self.current_adapter = nil

  local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

  vim.api.nvim_create_autocmd("User", {
    pattern = "CodeCompanionRequest*",
    group = group,
    callback = function(event)
      if event.match == "CodeCompanionRequestStarted" then
        self.processing = true
      elseif event.match == "CodeCompanionRequestFinished" then
        self.processing = false
      end
      -- Update adapter name on each CC event
      local chat = safe_buf_get_chat(vim.api.nvim_get_current_buf())
      if chat and chat.adapter and chat.adapter.formatted_name then
        self.current_adapter = chat.adapter.formatted_name
      else
        self.current_adapter = nil
      end

      vim.cmd("redrawstatus")
    end,
  })

  -- Update adapter name on buffer enter, so status updates immediately when switching buffers
  vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    callback = function()
      local chat = safe_buf_get_chat(vim.api.nvim_get_current_buf())
      if chat and chat.adapter and chat.adapter.formatted_name then
        self.current_adapter = chat.adapter.formatted_name
      else
        self.current_adapter = nil
      end
      vim.cmd("redrawstatus")
    end,
  })
end

function Spinner:update_status()
  if self.processing then
    self.spinner_index = (self.spinner_index % self.spinner_symbols_len) + 1
    if self.current_adapter then
      return self.current_adapter .. " " .. self.spinner_symbols[self.spinner_index]
    else
      return self.spinner_symbols[self.spinner_index]
    end
  end

  -- Not processing: show just the adapter if available, else empty string
  return self.current_adapter or ""
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight-moon',
    refresh = {
      statusline = 100, -- smooth spinner animation
    },
  },
  sections = {
    lualine_a = {
      { 'filename', path = 1 }
    },
    lualine_x = {
      Spinner,
    },
  },
}

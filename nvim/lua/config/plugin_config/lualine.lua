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

local function get_display_info(chat)
  if not chat then return nil end
  
  local adapter_name = "Unknown"
  local model_name = ""
  
  -- Get adapter name - prefer custom name over generic ones
  if chat.adapter then
    if chat.adapter.name == "openrouter" then
      adapter_name = "OpenRouter"
    elseif chat.adapter.name and chat.adapter.name ~= "openai" then
      adapter_name = chat.adapter.name:gsub("^%l", string.upper) -- Capitalize first letter
    elseif chat.adapter.formatted_name and chat.adapter.formatted_name ~= "OpenAI" then
      adapter_name = chat.adapter.formatted_name
    else
      adapter_name = "OpenRouter" -- Default fallback for extended OpenAI adapters
    end
  end
  
  -- Try multiple ways to get model name (based on actual CodeCompanion structure)
  local possible_sources = {
    chat.adapter and chat.adapter.model and chat.adapter.model.name,           -- chat.adapter.model.name
    chat.adapter and chat.adapter.parameters and chat.adapter.parameters.model, -- chat.adapter.parameters.model
    chat.model,                                                                 -- chat.model (fallback)
    chat.opts and chat.opts.model,                                            -- chat.opts.model (fallback)
  }
  
  for _, source in ipairs(possible_sources) do
    if source and source ~= "" then
      model_name = tostring(source)
      break
    end
  end
  
  -- Clean up model name for better display
  if model_name ~= "" then
    model_name = model_name:gsub("^[^/]+/", "") -- Remove provider prefix (e.g., "deepseek/")
  end
  
  -- Format the display string
  if model_name ~= "" then
    -- Show both adapter and model
    return string.format("%s • %s", adapter_name, model_name)
  else
    return adapter_name
  end
end

function Spinner:init(options)
  Spinner.super.init(self, options)
  self.processing = false
  self.spinner_index = 1
  self.spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  self.spinner_symbols_len = #self.spinner_symbols
  self.current_info = nil
  
  local group = vim.api.nvim_create_augroup("CodeCompanionHooks", { clear = true })
  
  -- Handle CodeCompanion request events
  vim.api.nvim_create_autocmd("User", {
    pattern = "CodeCompanionRequest*",
    group = group,
    callback = function(event)
      if event.match == "CodeCompanionRequestStarted" then
        self.processing = true
      elseif event.match == "CodeCompanionRequestFinished" then
        self.processing = false
      end
      
      -- Update adapter and model info
      local chat = safe_buf_get_chat(vim.api.nvim_get_current_buf())
      self.current_info = get_display_info(chat)
      vim.cmd("redrawstatus")
    end,
  })
  
  -- Update info when entering CodeCompanion buffers
  vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    callback = function()
      local chat = safe_buf_get_chat(vim.api.nvim_get_current_buf())
      if chat then
        self.current_info = get_display_info(chat)
      else
        self.current_info = nil
      end
      vim.cmd("redrawstatus")
    end,
  })
  
  -- Also update when the model changes (if user switches models in chat)
  vim.api.nvim_create_autocmd("User", {
    pattern = "CodeCompanionChatAdapter",
    group = group,
    callback = function()
      local chat = safe_buf_get_chat(vim.api.nvim_get_current_buf())
      self.current_info = get_display_info(chat)
      vim.cmd("redrawstatus")
    end,
  })
end

function Spinner:update_status()
  if not self.current_info then
    return ""
  end
  
  if self.processing then
    self.spinner_index = (self.spinner_index % self.spinner_symbols_len) + 1
    return self.current_info .. " " .. self.spinner_symbols[self.spinner_index]
  end
  
  return self.current_info
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
      -- Optional: Add file encoding and format
      'encoding',
      'fileformat',
      'filetype'
    },
  },
}

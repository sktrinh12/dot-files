require("codecompanion").setup({
    adapters = {
      http = {
        openrouter = function()
          return require("codecompanion.adapters").extend("openrouter", {
            env = {
              api_key = "",
            },
            schema = {
              model = {
                default = "nvidia/nemotron-3.5-super-vl:free",
                choices = {
                  "qwen/qwen-2.5-coder-32b-instruct",  -- Excellent code-specific model [PAID]
                  "anthropic/claude-3.5-haiku",         -- Fast, budget-friendly option from Anthropic [PAID]
                  "nvidia/nemotron-3.5-super-vl:free",
                  "nvidia/nemotron-3.5-lightning:free",
                  "poolside/laguna-s-2.1:free",
                  "nvidia/nemotron-3-super-120b-a12b:free",
                  "dots-studio/dots-3-note-preview:free",
                  "thinkingmachines/inkling:free",
                  "cohere/north-mini-code:free",
                  "thinkingmachines/inkling-small-20260730:free",
                  "poolside/laguna-xs-2.1:free",
                  "nvidia/nemotron-3-nano-omni-30b-a3b-reasoning:free",
                  "google/gemma-4-26b-a4b-it:free",
                },
              },
            },
          })
        end,

        litellm = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            name = "litellm",
            url = "http://127.0.0.1:4000/v1/chat/completions",
            env = {
              api_key = "",
            },
            schema = {
              model = {
                default = "deepseek/deepseek-chat",
                choices = {
                  "deepseek/deepseek-chat",
                  "deepseek/deepseek-r1",
                  "gemini/gemini-2.5-flash",
                  "glm-4.7-flash",
                  "dashscope/qwen3-coder-flash",
                },
              },
            },
          })
        end,
      },
    },
    interactions = {
      chat = { adapter = "litellm" },
      inline = { adapter = "litellm" },
      cmd = { adapter = "litellm" },
    },
    opts = {
      log_level = "ERROR",
    },
  prompt_library = {
    ["Log work notes"] = {
      interaction = "chat",
      description = "Log note sections into sqlite work database",
      opts = {
        is_slash_cmd = true,
        alias = "log",
        auto_submit = true,
        stop_context_insertion = true,
        ignore_system_prompt = true,
      },
      prompts = {
        {
          role = "system",
          content = "You convert work notes into shell commands. Output only what is asked for. Never edit or rewrite the note, and never write application code.",
        },
        {
          role = "user",
          content = function(context)
            local path = vim.api.nvim_buf_get_name(context.bufnr)
            local client = vim.fn.fnamemodify(path, ":h:h:h:t")
            local lines = vim.api.nvim_buf_get_lines(context.bufnr, 0, -1, false)

            -- Split the note into sections whose heading starts with a work item id
            local sections, current = {}, nil
            for _, line in ipairs(lines) do
              local hashes, rest = line:match("^(#+)%s+(.*)$")
              if hashes then
                local id = rest:match("^([A-Z]+%-?%d+)%f[%W]")
                if id then
                  current = { id = id, level = #hashes, body = {} }
                  table.insert(sections, current)
                elseif current and #hashes <= current.level then
                  current = nil -- a non-work-item heading at the same/higher level ends the section
                elseif current then
                  table.insert(current.body, line)
                end
              elseif current then
                table.insert(current.body, line)
              end
            end

            if #sections == 0 then
              return "Reply only with: No work item sections found."
            end

            local parts = {}
            for _, s in ipairs(sections) do
              table.insert(parts, string.format(
                "=== %s ===\n%s\n\nTEMPLATE:\ntlog log --start : --end : --category \"informatics work\" --client %s --desc \"%s - <DESCRIPTION>\"",
                s.id, table.concat(s.body, "\n"), client, s.id
              ))
            end

            return [[
        For each section below, write one line by copying its TEMPLATE exactly and replacing <DESCRIPTION> with a single concise sentence (no trailing period) summarizing what the section's notes say was done.
        Use only information from that section's own notes. Do not change anything else in the template, including the ID.
        Output one fenced ```bash block containing the lines, and nothing else.

        ]] .. table.concat(parts, "\n\n")
          end,
        },
      },
    },
  },
})

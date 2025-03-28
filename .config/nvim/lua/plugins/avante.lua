
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "openrouter",
    openai = {    
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o",
      timeout = 30000,
      temperature = 0.7,
      max_completion_tokens = 8192,
      api_key_name = "GPT_API_KEY",
    },
    ollama = {
      endpoint = "http://127.0.0.1:11434",
      model = "qwen:7b",
    },
    vendors = {
      claude = {
        endpoint = "https://api.anthropic.com/v1/messages",
        api_key_name = "ANTHROPIC_API_KEY", 
        model = "claude-3.5-sonnet", 
        stream = true, 
        temperature = 0.7,
        max_tokens = 8192,
        timeout = 30000,
        headers = {
          ["Content-Type"] = "application/json",
          ["x-api-key"] = os.getenv("ANTHROPIC_API_KEY"), 
          ["anthropic-version"] = "2023-06-01"
        },
        request_template = {
            model = "${model}",
            max_tokens = "${max_tokens}",
            messages = {
              {
                role = "user",
                content = "${prompt}"
              }
            },
            stream = "${stream}",
            temperature = "${temperature}"
          }
      },
      openrouter = {
        __inherited_from = 'openai',
        stream = false, 
        endpoint = 'https://openrouter.ai/api/v1',
        api_key_name = 'OPENROUTER_API_KEY',
        model = 'deepseek/deepseek-chat-v3-0324:free',
      },
    },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.pick",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },

  -- ✅ Keymaps for Avante Commands
  config = function()
    require("avante").setup()

    -- Keybindings for AI Chat and Commands
    vim.keymap.set("n", "<leader>ac", "<cmd>AvanteChat<CR>", { desc = "Open the AI Chat" })
    vim.keymap.set("n", "<leader>ai", "<cmd>AvanteInline<CR>", { desc = "AI Inline Command" })
    vim.keymap.set("v", "<leader>ae", ":AvanteInline<CR>", { desc = "Execute AI on Selection" })
  end
}

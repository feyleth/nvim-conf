return {
  -- {
  --   "Davidyz/VectorCode",
  --   otps = {
  --     n_query = 5,
  --     async_backend = "lsp",
  --     async_opts = {
  --       notify = true,
  --       query_cb = require("vectorcode.utils").make_lsp_document_symbol_cb(),
  --     },
  --     notify = true,
  --   },
  --   version = "*", -- optional, depending on whether you're on nightly or release
  --   build = "pipx upgrade vectorcode", -- optional but recommended if you set `version = "*"`
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   cmd = "VectorCode", -- if you're lazy-loading VectorCode
  -- },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_y, require("vectorcode.integrations").lualine({ show_job_count = true }))
  --   end,
  -- },
  -- {
  --   "milanglacier/minuet-ai.nvim",
  --   dependencies = {
  --     "Davidyz/VectorCode",
  --   },
  --   config = function()
  --     local has_vc, vectorcode_config = pcall(require, "vectorcode.config")
  --     local vectorcode_cacher = nil
  --     if has_vc then
  --       vectorcode_cacher = vectorcode_config.get_cacher_backend()
  --     end
  --
  --     require("minuet").setup({
  --       provider = "openai_fim_compatible",
  --       n_completions = 1, -- recommend for local model for resource saving
  --       -- I recommend beginning with a small context window size and incrementally
  --       -- expanding it, depending on your local computing power. A context window
  --       -- of 512, serves as an good starting point to estimate your computing
  --       -- power. Once you have a reliable estimate of your local computing power,
  --       -- you should adjust the context window to a larger value.
  --       context_window = 10024,
  --       provider_options = {
  --         openai_fim_compatible = {
  --           api_key = "TERM",
  --           name = "ollama",
  --           stream = true,
  --           end_point = "http://localhost:11434/v1/completions",
  --           -- The model is set by the llama-cpp server and cannot be altered
  --           -- post-launch.
  --           model = "my-assystant",
  --           optional = {
  --             max_tokens = 56,
  --             top_p = 0.9,
  --           },
  --           template = {
  --             prompt = function(pref, suff)
  --               local prompt_message = "<|repo_name|>my-project\n"
  --               local cache_result = vectorcode_cacher.query_from_cache(0)
  --               for _, file in ipairs(cache_result) do
  --                 prompt_message = prompt_message .. "<|file_sep|>" .. file.path .. "\n" .. file.document
  --               end
  --               return prompt_message .. "<|fim_prefix|>" .. pref .. "<|fim_suffix|>" .. suff .. "<|fim_middle|>"
  --             end,
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "saghen/blink.cmp",
  --   optional = true,
  --   opts = {
  --     keymap = {
  --       ["<A-y>"] = {
  --         function(cmp)
  --           cmp.show({ providers = { "minuet" } })
  --         end,
  --       },
  --     },
  --     sources = {
  --       -- if you want to use auto-complete
  --       default = { "minuet" },
  --       providers = {
  --         minuet = {
  --           name = "minuet",
  --           module = "minuet.blink",
  --           score_offset = 100,
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
    },
    opts = {
      log_level = "INFO",
      strategies = {
        chat = {
          adapter = "qwen",
          slash_commands = {
            ["file"] = {
              opts = {
                provider = "snacks", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
              },
            },
            ["buffer"] = {
              opts = {
                provider = "snacks", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
              },
            },
            ["help"] = {
              opts = {
                provider = "snacks", -- telescope|mini_pick|fzf_lua
              },
            },
            ["symbols"] = {
              opts = {
                provider = "snacks", -- default|telescope|mini_pick|fzf_lua
              },
            },
          },
        },
        inline = {
          adapter = "qwen",
        },
      },
      language = "French",
      adapters = {
        qwen = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "http://localhost:8000",
            },
            schema = {
              model = {
                default = "qwen2.5-coder:7b",
              },
            },
          })
        end,
        qwen_old = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwen", -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = "qwen2.5-coder:7b",
              },
              num_ctx = {
                default = 20000,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
      },
    },
    init = function()
      require("plugins.fidget.ai"):init()
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
}

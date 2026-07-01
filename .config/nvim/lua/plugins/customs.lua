return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded",
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      views = {
        hover = {
          border = {
            style = "rounded", -- single, double, rounded, solid, shadow
          },
        },
      },
    },
  },
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "snacks.nvim",
    opts = {
      -- NOTE: zen
      zen = {
        ---@type table<string, boolean>
        toggles = {
          dim = false,
          git_signs = false,
          mini_diff_signs = false,
          -- diagnostics = false,
          -- inlay_hints = false,
        },
        show = {
          statusline = true, -- only works with global statusline
          tabline = false,
        },
        win = {
          backdrop = {
            transparent = false,
            blend = 99,
          },
        },
      },

      -- NOTE: terminal
      terminal = {
        win = {
          position = "float",
          border = "rounded",
        },
      },

      -- NOTE: dashboard
      dashboard = {
        preset = {
          header = [[
███╗░░░███╗███████╗███╗░░░███╗███████╗███╗░░██╗████████╗░█████╗░  ███╗░░░███╗░█████╗░██████╗░██╗
████╗░████║██╔════╝████╗░████║██╔════╝████╗░██║╚══██╔══╝██╔══██╗  ████╗░████║██╔══██╗██╔══██╗██║
██╔████╔██║█████╗░░██╔████╔██║█████╗░░██╔██╗██║░░░██║░░░██║░░██║  ██╔████╔██║██║░░██║██████╔╝██║
██║╚██╔╝██║██╔══╝░░██║╚██╔╝██║██╔══╝░░██║╚████║░░░██║░░░██║░░██║  ██║╚██╔╝██║██║░░██║██╔══██╗██║
██║░╚═╝░██║███████╗██║░╚═╝░██║███████╗██║░╚███║░░░██║░░░╚█████╔╝  ██║░╚═╝░██║╚█████╔╝██║░░██║██║
╚═╝░░░░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░░╚════╝░  ╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝
        ]],
        },
      },

      -- NOTE: picker
      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
          },
        },
      },
    },
  },
}

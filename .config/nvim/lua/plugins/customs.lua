return {
  { "nvim-mini/mini.icons", enable = false },
  { "nvim-tree/nvim-web-devicons" },
  { "kdheepak/lazygit.nvim", enable = false },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,

      on_colors = function(colors)
        -- Night Owl navy background
        --colors.bg = "#011627"
        colors.bg = "#0B1220"
        colors.bg_dark = "#01111d"
        colors.bg_sidebar = "#01111d"
        colors.bg_float = "#0B1220"

        -- Slightly brighter selection
        colors.bg_highlight = "#143652"

        -- Keep Tokyo Night accents
        colors.blue = "#82AAFF"
        colors.cyan = "#7FDBCA"
        colors.green = "#22DA6E"
        colors.orange = "#F78C6C"
        colors.yellow = "#ECC48D"
        colors.red = "#EF5350"
        colors.magenta = "#C792EA"

        -- Foreground
        colors.fg = "#D6DEEB"
        colors.fg_dark = "#A6ACCD"
        colors.comment = "#637777"
      end,

      on_highlights = function(hl, c)
        hl.Normal = { bg = c.bg }
        hl.NormalNC = { bg = c.bg }
        hl.NormalFloat = { bg = c.bg_float }
        hl.FloatBorder = { fg = "#3B4A63", bg = c.bg_float }

        hl.CursorLine = { bg = "#10243D" }
        hl.CursorLineNr = { fg = "#82AAFF", bold = true }

        hl.Visual = { bg = "#1D3B53" }
        hl.Search = { bg = "#2D4F67", fg = c.fg }
        hl.IncSearch = { bg = "#FFCB8B", fg = "#0B1220" }

        hl.LineNr = { fg = "#3B4A63" }
        hl.SignColumn = { bg = c.bg }

        hl.Pmenu = { bg = "#011B2B" }
        hl.PmenuSel = { bg = "#1D3B53" }
      end,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "NONE" })

      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = "auto",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(mode)
                return mode:sub(1, 3)
              end,
            },
          },
          lualine_b = {},

          lualine_c = {
            { LazyVim.lualine.pretty_path() },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {},
          lualine_z = {
            "branch",
          },
        },
        extensions = { "neo-tree", "lazy", "fzf" },
      }

      -- do not add trouble symbols if aerial is enabled
      -- And allow it to be overriden for some buffer types (see autocmds)
      if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
        local trouble = require("trouble")
        local symbols = trouble.statusline({
          mode = "symbols",
          groups = {},
          title = false,
          filter = { range = true },
          format = "{kind_icon}{symbol.name:Normal}",
          hl_group = "lualine_c_normal",
        })
        table.insert(opts.sections.lualine_c, {
          symbols and symbols.get,
          cond = function()
            return vim.b.trouble_lualine ~= false and symbols.has()
          end,
        })
      end

      return opts
    end,
  },
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
          tabline = true,
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

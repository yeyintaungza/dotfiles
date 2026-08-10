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
        colors.bg = "#0B1220"
        colors.bg_dark = "#080F1C"
        colors.bg_sidebar = "#080F1C"
        colors.bg_float = "#101B2D"
        colors.bg_highlight = "#1A304B"

        colors.blue = "#82AAFF"
        colors.cyan = "#7FDBCA"
        colors.green = "#22DA6E"
        colors.orange = "#F78C6C"
        colors.yellow = "#ECC48D"
        colors.red = "#EF5350"
        colors.magenta = "#C792EA"

        colors.fg = "#C4D2E5"
        colors.fg_dark = "#8296B2"
        colors.comment = "#5C6D84"

        colors.border = "#263A54"
        colors.fg_gutter = "#34445B"
      end,

      on_highlights = function(hl, c)
        hl.Normal = {
          fg = c.fg,
          bg = c.bg,
        }

        hl.NormalNC = {
          fg = c.fg,
          bg = c.bg,
        }

        hl.NormalFloat = {
          fg = c.fg,
          bg = c.bg_float,
        }

        hl.FloatBorder = {
          fg = "#263A54",
          bg = c.bg_float,
        }

        hl.FloatTitle = {
          fg = c.blue,
          bg = c.bg_float,
          bold = true,
        }

        hl.CursorLine = {
          bg = "#101B2D",
        }

        hl.CursorLineNr = {
          fg = "#8296B2",
          bold = true,
        }

        hl.Visual = {
          bg = "#1A304B",
        }

        hl.Search = {
          fg = c.fg,
          bg = "#1C3552",
        }

        hl.IncSearch = {
          fg = "#0B1220",
          bg = "#ECC48D",
        }

        hl.CurSearch = {
          fg = "#0B1220",
          bg = "#ECC48D",
        }

        hl.LineNr = {
          fg = "#34445B",
        }

        hl.SignColumn = {
          bg = "#080F1C",
        }

        hl.GitSignsAdd = {
          fg = "#294D45",
          bg = "#080F1C",
        }

        hl.GitSignsChange = {
          fg = "#31547A",
          bg = "#080F1C",
        }

        hl.GitSignsDelete = {
          fg = "#5A3440",
          bg = "#080F1C",
        }

        hl.Pmenu = {
          fg = c.fg,
          bg = "#101B2D",
        }

        hl.PmenuSel = {
          fg = c.fg,
          bg = "#1A304B",
        }

        hl.PmenuSbar = {
          bg = "#1A2B42",
        }

        hl.PmenuThumb = {
          bg = "#304A6D",
        }

        hl.LspInfoBorder = {
          fg = "#263A54",
          bg = "#101B2D",
        }

        hl.HoverNormal = {
          fg = c.fg,
          bg = "#101B2D",
        }

        hl.MsgArea = {
          fg = c.fg,
          bg = c.bg,
        }

        hl.MoreMsg = {
          fg = c.blue,
        }

        hl.Question = {
          fg = c.cyan,
        }

        hl.ErrorMsg = {
          fg = c.red,
        }

        hl.WarningMsg = {
          fg = c.yellow,
        }

        hl.StatusLine = {
          fg = c.fg,
          bg = "#0D1728",
        }

        hl.StatusLineNC = {
          fg = "#8296B2",
          bg = "#0D1728",
        }

        hl.TabLine = {
          fg = "#5C6D84",
          bg = "#080F1C",
        }

        hl.TabLineFill = {
          bg = "#080F1C",
        }

        hl.TabLineSel = {
          fg = "#C4D2E5",
          bg = "#0B1220",
          bold = true,
        }

        hl.WinBar = {
          fg = "#8296B2",
          bg = "#0B1220",
        }

        hl.WinBarNC = {
          fg = "#5C6D84",
          bg = "#0B1220",
        }

        hl.WinSeparator = {
          fg = "#111D2E",
          bg = c.bg,
        }

        hl.VertSplit = {
          fg = "#111D2E",
          bg = c.bg,
        }

        hl.Folded = {
          fg = "#8296B2",
          bg = "#101B2D",
        }

        hl.FoldColumn = {
          fg = "#34445B",
          bg = "#080F1C",
        }
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

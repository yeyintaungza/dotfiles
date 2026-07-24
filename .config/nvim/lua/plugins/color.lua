return {

  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          }
        end,
        transparent = false,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
    end,
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker",
      })
    end,
  },
  { "yorumicolors/yorumi.nvim" },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      local transparent = false

      local coolnight = {
        bg = "#011323",
        bg_dark = "#00111E",
        bg_float = "#00111E",
        bg_highlight = "#012646",
        bg_search = "#3E90D7",
        bg_sidebar = "#00111E",
        bg_statusline = "#00111E",
        bg_visual = "#064984",

        fg = "#E3EEF7",
        fg_dark = "#AECBE5",
        fg_float = "#CBDFF0",
        fg_gutter = "#2D4F6C",
        fg_sidebar = "#AECBE5",

        border = "#03447C",
      }

      require("tokyonight").setup({
        style = "storm",
        transparent = transparent,
        lualine_bold = true,

        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },

        on_colors = function(c)
          c.bg = coolnight.bg
          c.bg_dark = transparent and c.none or coolnight.bg_dark
          c.bg_float = transparent and c.none or coolnight.bg_float
          c.bg_sidebar = transparent and c.none or coolnight.bg_sidebar
          c.bg_statusline = transparent and c.none or coolnight.bg_statusline
          c.bg_highlight = coolnight.bg_highlight
          c.bg_visual = coolnight.bg_visual
          c.bg_search = coolnight.bg_search

          c.fg = coolnight.fg
          c.fg_dark = coolnight.fg_dark
          c.fg_float = coolnight.fg_float
          c.fg_sidebar = coolnight.fg_sidebar
          c.fg_gutter = coolnight.fg_gutter
        end,

        on_highlights = function(hl, c)
          hl.FloatBorder = {
            fg = coolnight.border,
            bg = transparent and "NONE" or c.bg_float,
          }

          hl.NormalFloat = {
            bg = transparent and "NONE" or c.bg_float,
          }

          hl.WinSeparator = {
            fg = coolnight.border,
          }

          hl.VertSplit = {
            fg = coolnight.border,
          }

          hl.Search = {
            bg = coolnight.bg_search,
            fg = c.bg,
          }

          hl.Visual = {
            bg = coolnight.bg_visual,
          }
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "yorumi",
    },
  },
}

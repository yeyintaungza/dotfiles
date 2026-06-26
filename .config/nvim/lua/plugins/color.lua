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
        transparent = true,
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
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_enable_italic = true
      vim.g.everforest_transparent_background = 2
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          local transparent = { bg = "NONE" }

          vim.api.nvim_set_hl(0, "NormalFloat", transparent)
          vim.api.nvim_set_hl(0, "FloatBorder", transparent)
          vim.api.nvim_set_hl(0, "FloatTitle", transparent)

          vim.api.nvim_set_hl(0, "SnacksNormal", transparent)
          vim.api.nvim_set_hl(0, "SnacksNormalNC", transparent)
          vim.api.nvim_set_hl(0, "SnacksBorder", transparent)
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}

return {

  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
      vim.o.background = "dark"
      require("solarized").setup({
        transparent = {
          enabled = true,
        },
        variant = "autumn", -- "spring" | "summer" | "autumn" | "winter" (default)
      })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        transparent = true,
        keywordStyle = { italic = false },
        commentStyle = { italic = false },
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
    "LazyVim/LazyVim",
    opts = {
      --colorscheme = "solarized",
      colorscheme = "kanagawa",
    },
  },
}

return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "deep",
        transparent = true,
      })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
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
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("jb").setup({ transparent = false })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}

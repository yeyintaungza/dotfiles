return {

  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
      style = "darker",

      colors = {
        bg0 = "#0B1220",
      },

      highlights = {
        NormalFloat = {
          bg = "#0B1220",
        },

        FloatBorder = {
          bg = "#0B1220",
          fg = "#3B4252",
        },

        Pmenu = {
          bg = "#0B1220",
          fg = "#D8DEE9",
        },

        PmenuSel = {
          bg = "#1A2433",
          fg = "#FFFFFF",
        },

        PmenuSbar = {
          bg = "#111A2A",
        },

        PmenuThumb = {
          bg = "#3B4252",
        },
      },
    },

    config = function(_, opts)
      require("onedark").setup(opts)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}

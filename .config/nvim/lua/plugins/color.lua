return {

  { "projekt0n/github-nvim-theme", name = "github-theme" },
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup({
        style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = true,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_dimmed",
    },
  },
}

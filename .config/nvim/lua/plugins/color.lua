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
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
}

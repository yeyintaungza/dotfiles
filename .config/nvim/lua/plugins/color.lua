return {

  { "yorumicolors/yorumi.nvim" },
  {
    "vague-theme/vague.nvim",
    config = function()
      require("vague").setup({
        italic = false,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}

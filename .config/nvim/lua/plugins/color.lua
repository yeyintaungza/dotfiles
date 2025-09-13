return {

    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
    { "Shatur/neovim-ayu" },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    },
}

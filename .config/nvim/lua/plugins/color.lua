return {

    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("onedark").setup({
                style = "darker",
            })
            -- Enable theme
        end,
    },
    { "projekt0n/github-nvim-theme", name = "github-theme" },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark",
        },
    },
}
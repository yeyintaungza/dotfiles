return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_background = "medium"
            vim.g.gruvbox_material_foreground = "original"
        end,
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox-material",
        },
    },
}

return {
    {
        "NachoNievaG/atac.nvim",
        dependencies = { "akinsho/toggleterm.nvim" },
        config = function()
            require("atac").setup({
                dir = "~/Documents", -- By default, the dir will be set as /tmp/atac
            })
        end,
    },
}

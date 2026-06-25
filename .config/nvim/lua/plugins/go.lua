return {
  {
    "maxandron/goplements.nvim",
    ft = "go",
    opts = {
      display_package = true,
    },
  },

  -- NOTE: this plugin is already lazy-loaded and adds only about 1ms
  -- of load time to your config
  -- :GoInstallDeps
  -- This will install the following tools:
  -- gomodifytags
  -- impl
  -- gotests
  -- iferr
  -- json2go
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    -- branch = "develop"
    -- (optional) updates the plugin's dependencies on each update
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    ---@module "gopher"
    ---@type gopher.Config
    opts = {},
    config = function(_, opts)
      require("gopher").setup(opts)

      local map = vim.keymap.set

      map("n", "gtj", "<cmd>GoTagAdd json<cr>", { desc = "Add json tags" })
      map("n", "gty", "<cmd>GoTagRm json<cr>", { desc = "Remove json tags" })

      vim.keymap.set("n", "gi", function()
        local iface = vim.fn.input("Interface: ")
        vim.cmd("GoImpl " .. iface)
      end, { desc = "Generate interface impl" })

      map("n", "gtt", "<cmd>GoTestAdd<cr>", { desc = "Generate tests" })

      map("n", "ge", "<cmd>GoIfErr<cr>", { desc = "Generate if err" })

      map("n", "gj", "<cmd>GoJson2Struct<cr>", { desc = "JSON to struct" })
    end,
  },
}

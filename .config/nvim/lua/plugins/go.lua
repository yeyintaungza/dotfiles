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
  },
}

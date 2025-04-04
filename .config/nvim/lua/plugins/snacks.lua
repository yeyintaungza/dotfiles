return {
  {
    "snacks.nvim",
    opts = {

      --NOTE:
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣾⣿⣿⣿⣿⣷⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀
⠀⠀⠀⢠⣾⣿⣿⡿⠛⠉⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⠉⠻⢿⣿⣿⣷⡄⠀⠀⠀
⠀⠀⣰⣿⣿⡟⠁⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠙⢿⣿⣿⣦⠀⠀
⠀⣼⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣧⠀
⢰⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⡆
⣾⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣷
⣿⣿⣿⠀⠀⣦⣄⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⣀⣴⠂⠀⣿⣿⣿
⣿⣿⣿⠀⠀⠘⣿⣿⣶⣄⡀⠀⣿⣿⣿⣿⣿⣿⠀⠀⣠⣴⣿⣿⠃⠀⢀⣿⣿⡿
⢸⣿⣿⣇⠀⠀⠈⠛⠿⠛⠁⠀⣿⣿⣿⣿⣿⣿⠀⠈⠛⠿⠛⠁⠀⠀⣼⣿⣿⠇
⠀⢻⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡟⠀
⠀⠀⢻⣿⣿⣧⡀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⣠⣾⣿⣿⠟⠀⠀
⠀⠀⠀⠙⢿⣿⣿⣷⣤⣀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⣀⣴⣾⣿⣿⡿⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠻⠿⢿⣿⣿⣿⣿⣿⠿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀
MAXIMUM EFFORT
]],
        -- https://emojicombos.com/darth-vader-ascii-art
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
        },
        },
      },

      --NOTE:
      zen = {
        ---@type table<string, boolean>
        toggles = {
          dim = false,
          git_signs = false,
          mini_diff_signs = false,
          -- diagnostics = false,
          -- inlay_hints = false,
        },
        show = {
          statusline = true, -- can only be shown when using the global statusline
          tabline = false,
        },
      },

      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
          },
        },
      },
    },
  },
}

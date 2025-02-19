-- why wezterm over alacritty : multiplexer feature

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Create a configuration table
local config = {}

--  minimized window borders
config.window_decorations = "RESIZE"

-- Font settings
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
})
config.font_size = 14.0
config.line_height = 1.0

-- Colors
config.colors = {
	foreground = "#839496", -- Solarized base0 (soft grayish white)
	background = "#002b36", -- Solarized base03 (dark background)
	cursor_bg = "#268bd2", -- Solarized blue (cursor background)
	cursor_fg = "#002b36", -- Solarized base03 (cursor foreground)
	ansi = {
		"#073642", -- black (Solarized base02)
		"#dc322f", -- red (Solarized red)
		"#859900", -- green (Solarized green)
		"#b58900", -- yellow (Solarized yellow)
		"#268bd2", -- blue (Solarized blue)
		"#d33682", -- magenta (Solarized magenta)
		"#2aa198", -- cyan (Solarized cyan)
		"#eee8d5", -- white (Solarized base2)
	},
	brights = {
		"#002b36", -- bright black (Solarized base03)
		"#dc322f", -- bright red (Solarized red)
		"#859900", -- bright green (Solarized green)
		"#b58900", -- bright yellow (Solarized yellow)
		"#268bd2", -- bright blue (Solarized blue)
		"#d33682", -- bright magenta (Solarized magenta)
		"#2aa198", -- bright cyan (Solarized cyan)
		"#fdf6e3", -- bright white (Solarized base3)
	},
}

-- Window opacity and blur
config.window_background_opacity = 0.9

-- Disable padding for a clean look when using applications like nvim
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Tab bar appearance
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Scrollback settings
config.scrollback_lines = 5000

-- Enable Wayland support if using Wayland
if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	config.enable_wayland = true
end

-- multiplexer config
-- ctl + space to trigger
--  awsome , now i can be happy with helix
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {

	--NOTE: spliting
	{ -- vertical split
		mods = "LEADER",
		key = "=",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{ -- horizontal split
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	--NOTE: Zoom in/out
	{
		mods = "LEADER",
		key = "m",
		action = wezterm.action.TogglePaneZoomState,
	},

	--NOTE: close
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},

	--NOTE: choose pane
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	--NOTE: rotate panes
	{
		mods = "LEADER",
		key = "Space",
		action = wezterm.action.RotatePanes("Clockwise"),
	},
	--NOTE: pane selection, swap wtih active pane
	{
		mods = "LEADER",
		key = "o",
		action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }),
	},
}

-- Return the completed configuration table
return config

-- some short cuts
-- ctrl shift  f : search

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
config.line_height = 1.5

-- Colors
config.colors = {
	foreground = "#DCD7BA", -- Kanagawa base foreground (light yellowish beige)
	background = "#1F1F28", -- Kanagawa base background (dark, almost black)
	cursor_bg = "#7E9CD8", -- Kanagawa cursor background (light blue)
	cursor_fg = "#1F1F28", -- Kanagawa cursor foreground (dark background)
	ansi = {
		"#3B4B5A", -- black (Kanagawa dark grayish blue)
		"#E46876", -- red (Kanagawa red)
		"#A8C023", -- green (Kanagawa green)
		"#F1A440", -- yellow (Kanagawa yellow)
		"#7E9CD8", -- blue (Kanagawa blue)
		"#9E70B3", -- magenta (Kanagawa magenta)
		"#50A8A1", -- cyan (Kanagawa cyan)
		"#DCD7BA", -- white (Kanagawa light beige)
	},
	brights = {
		"#1F1F28", -- bright black (Kanagawa base dark background)
		"#E46876", -- bright red (Kanagawa red)
		"#A8C023", -- bright green (Kanagawa green)
		"#F1A440", -- bright yellow (Kanagawa yellow)
		"#7E9CD8", -- bright blue (Kanagawa blue)
		"#9E70B3", -- bright magenta (Kanagawa magenta)
		"#50A8A1", -- bright cyan (Kanagawa cyan)
		"#F1F1F0", -- bright white (Kanagawa lightest background)
	},
}

-- Window opacity and blur
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

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

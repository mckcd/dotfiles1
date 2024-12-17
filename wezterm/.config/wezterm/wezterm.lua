-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_wayland = true
-- local keys = require("keys")

-- spawn in bash
config.default_prog = { "/usr/bin/bash", "-" }
-- This is where you actually apply your config choices
config.window_decorations = "RESIZE"
-- config.enable_tab_bar = false

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

config.default_cursor_style = "SteadyUnderline"

-- Define the Everforest theme
-- config.color_schemes = {
-- 	["Everforest"] = {
-- 		foreground = "#D3C6AA",
-- 		background = "#2F383E",
-- 		cursor_bg = "#D3C6AA",
-- 		cursor_border = "#D3C6AA",
-- 		cursor_fg = "#2F383E",
-- 		selection_bg = "#4C565C",
-- 		selection_fg = "#D3C6AA",
--
-- 		ansi = { "#4F5B66", "#F85552", "#8DA101", "#DFA000", "#3A94C5", "#DF69BA", "#35A77C", "#DFDBCA" },
-- 		brights = { "#65737E", "#F85552", "#8DA101", "#DFA000", "#3A94C5", "#DF69BA", "#35A77C", "#EFF1F5" },
-- 	},
-- }

config.colors = {
	cursor_bg = "#FFFFFF", -- Set cursor background color to white
	cursor_fg = "#000000", -- Set cursor text color to black (for contrast)
	cursor_border = "#FFFFFF", -- Set cursor border color to white
	compose_cursor = "orange", -- Cursor color when the leader key is active
}

config.window_background_opacity = 0.8 -- Adjust the opacity level (0.0 to 1.0)

config.font = wezterm.font_with_fallback({
	"Hurmit Nerd Font",
	"Hurmit",
	"Fira Code",
	"JetBrains Mono",
})

config.font_size = 15.0 -- Adjust the font size as needed

config.window_padding = {
	left = "0.2cell",
	right = "0.2cell",
	top = "0.2cell",
	bottom = "0.0cell",
}

config.max_fps = 240

-- keys.setup(config)

-- tmu
config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = {
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER|SHIFT",
		key = "%",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 20 },
		}),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "b",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER|SHIFT",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
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
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		mods = "LEADER",
		key = "w",
		action = wezterm.action.ActivateCommandPalette,
	},
}

for i = 0, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

-- and finally, return the configuration to wezterm
return config

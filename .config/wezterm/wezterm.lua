-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_wayland = true



-- This is where you actually apply your config choices
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

config.default_cursor_style = 'SteadyBar'


-- Define the Everforest theme
config.color_schemes = {
  ["Everforest"] = {
    foreground = "#D3C6AA",
    background = "#2F383E",
    cursor_bg = "#D3C6AA",
    cursor_border = "#D3C6AA",
    cursor_fg = "#2F383E",
    selection_bg = "#4C565C",
    selection_fg = "#D3C6AA",

    ansi = {"#4F5B66", "#F85552", "#8DA101", "#DFA000", "#3A94C5", "#DF69BA", "#35A77C", "#DFDBCA"},
    brights = {"#65737E", "#F85552", "#8DA101", "#DFA000", "#3A94C5", "#DF69BA", "#35A77C", "#EFF1F5"},
  },
}

config.window_background_opacity = 0.8 -- Adjust the opacity level (0.0 to 1.0)

config.font = wezterm.font_with_fallback({
  "Hurmit Nerd Font",
  "Hurmit",
  "Fira Code",
  "JetBrains Mono",
})

config.font_size = 12.0 -- Adjust the font size as needed

config.window_padding = {
  left = '0.2cell',
  right = '0.2cell',
  top = '0.2cell',
  bottom = '0.0cell',
}
-- and finally, return the configuration to wezterm
return config

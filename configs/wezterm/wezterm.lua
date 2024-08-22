-- Pull in the wezterm API
--- @type Wezterm
local wezterm = require 'wezterm'

-- This will hold the configuration.
-- local config = wezterm.config_builder()

local config = {}
config = wezterm.config_builder()

config.font = wezterm.font('DankMono Nerd Font Propo', { weight = 'Regular' })
config.font_size = 18
config.default_cursor_style = 'SteadyBlock'


config.color_scheme = 'shades-of-purple'

return config

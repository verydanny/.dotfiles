-- Pull in the wezterm API
--- @type Wezterm
local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.disable_default_key_bindings = false
config.debug_key_events = true
config.exit_behavior = 'CloseOnCleanExit'
config.window_close_confirmation = 'NeverPrompt'
config.keys = {
    -- Clears only the scrollback and leaves the viewport intact.
    -- You won't see a difference in what is on screen, you just won't
    -- be able to scroll back until you've output more stuff on screen.
    -- This is the default behavior.
    { key = "k", mods = "SUPER|CMD", action = { SendString = "dot" } },
    {
        key = 'k',
        mods = 'CMD',
        action = act.ClearScrollback 'ScrollbackOnly',
    },
    -- Clears the scrollback and viewport leaving the prompt line the new first line.
    {
        key = 'k',
        mods = 'CMD',
        action = act.ClearScrollback 'ScrollbackAndViewport',
    },
    -- Clears the scrollback and viewport, and then sends CTRL-L to ask the
    -- shell to redraw its prompt
    {
        key = 'k',
        mods = 'CMD',
        action = act.Multiple {
            act.ClearScrollback 'ScrollbackAndViewport',
            act.SendKey { key = 'l', mods = 'CTRL' },
        },
    },
}

config.color_scheme = 'shades-of-purple'
config.font = wezterm.font('DankMono Nerd Font Propo', { weight = 'Regular' })
config.font_size = 20

return config

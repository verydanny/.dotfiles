local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = wezterm.config_builder()

-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():maximize()
-- end)

-- Super hacky because `gui-startup` creates small window then big window, looks bad
config.initial_rows = 100
config.initial_cols = 200

config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = true
config.anti_alias_custom_block_glyphs = true

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

config.default_cursor_style = 'SteadyBlock'
config.custom_block_glyphs = true

-- config.exit_behavior = 'CloseOnCleanExit'
-- config.window_close_confirmation = 'NeverPrompt'

config.keys = {
    -- Clears only the scrollback and leaves the viewport intact.
    -- You won't see a difference in what is on screen, you just won't
    -- be able to scroll back until you've output more stuff on screen.
    -- This is the default behavior.
    -- {
    --     key = 'k',
    --     mods = 'CMD',
    --     action = act.ClearScrollback 'ScrollbackOnly',
    -- },
    -- Clears the scrollback and viewport leaving the prompt line the new first line.
    {
        key = 'k',
        mods = 'CMD',
        action = act.ClearScrollback 'ScrollbackAndViewport',
    },
    -- Clears the scrollback and viewport, and then sends CTRL-L to ask the
    -- shell to redraw its prompt
    -- {
    --     key = 'k',
    --     mods = 'CMD',
    --     action = act.Multiple {
    --         act.ClearScrollback 'ScrollbackAndViewport',
    --         act.SendKey { key = 'l', mods = 'CTRL' },
    --     },
    -- },
}

config.line_height = 1.0
config.color_scheme = 'shades-of-purple'
config.font = wezterm.font_with_fallback {
    {
        family = 'DankMono Nerd Font Propo',
        -- scale = 1
    },
    'MonoLisa Nerd Font Propo'
}
config.font_size = 20

--- GPU
config.front_end = 'WebGpu'
config.max_fps = 120

return config

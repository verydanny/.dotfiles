local act = wezterm.action

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.debug_key_events = true

config.keys = {
--   -- Clears only the scrollback and leaves the viewport intact.
--   -- You won't see a difference in what is on screen, you just won't
--   -- be able to scroll back until you've output more stuff on screen.
--   -- This is the default behavior.
--   {
--     key = 'K',
--     mods = 'CTRL|SHIFT',
--     action = act.ClearScrollback 'ScrollbackOnly',
--   },
--   -- Clears the scrollback and viewport leaving the prompt line the new first line.
--   {
--     key = 'K',
--     mods = 'CTRL|SHIFT',
--     action = act.ClearScrollback 'ScrollbackAndViewport',
--   },
--   -- Clears the scrollback and viewport, and then sends CTRL-L to ask the
--   -- shell to redraw its prompt
  {
    key = 'K',
    mods = 'CMD|SHIFT',
    action = act.ClearScrollback 'ScrollbackAndViewport',
    -- action = act.Multiple {
    --   act.ClearScrollback 'ScrollbackAndViewport',
    --   act.SendKey { key = 'L', mods = 'CTRL' },
    -- },
  },
}

config.font = wezterm.font('DankMono Nerd Font Propo', { weight = 'Regular' })
config.font_size = 20
config.default_cursor_style = 'SteadyBlock'


config.color_scheme = 'shades-of-purple'
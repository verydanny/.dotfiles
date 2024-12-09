local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = wezterm.config_builder()

-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():maximize()
-- end)

-- Super hacky because `gui-startup` creates small window then big window, looks bad
-- config.initial_rows = 45
-- config.initial_cols = 155

config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.anti_alias_custom_block_glyphs = false

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

config.default_cursor_style = 'SteadyBlock'
config.custom_block_glyphs = true

config.exit_behavior = 'CloseOnCleanExit'
-- config.window_close_confirmation = 'NeverPrompt'

config.keys = {
    {
        key = 'k',
        mods = 'CMD',
        action = act.ClearScrollback 'ScrollbackAndViewport',
    },
}

config.line_height = 1.0
config.color_scheme = 'shades-of-purple'
config.font = wezterm.font_with_fallback {
    "DankMono Nerd Font Propo",
    "MonoLisa Nerd Font Propo"
}
config.font_size = 20

--- GPU
config.front_end = 'WebGpu'
config.max_fps = 120
-- config.prefer_egl = true

-- Fancy tab bar
config.window_frame = {
    font = wezterm.font 'DankMono Nerd Font Propo',
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.

    -- The size of the font in the tab bar.
    -- Default to 10.0 on Windows but 12.0 on other systems
    font_size = 18.0,

    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#16152E',

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#16152E',
}

config.colors = {
    tab_bar = {
        -- The color of the strip that goes along the top of the window
        -- (does not apply when fancy tab bar is in use)
        background = '#1D1D3E',

        -- The active tab is the one that has focus in the window
        active_tab = {
            -- The color of the background area for the tab
            bg_color = '#1D1D3E',
            -- The color of the text for the tab
            fg_color = '#E4EFFD',

            -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
            -- label shown for this tab.
            -- The default is "Normal"
            intensity = 'Bold',

            -- Specify whether you want "None", "Single" or "Double" underline for
            -- label shown for this tab.
            -- The default is "None"
            underline = 'Single',

            -- Specify whether you want the text to be italic (true) or not (false)
            -- for this tab.  The default is false.
            italic = true,


            -- Specify whether you want the text to be rendered with strikethrough (true)
            -- or not for this tab.  The default is false.
            strikethrough = false,
        },

        -- Inactive tabs are the tabs that do not have focus
        inactive_tab = {
            bg_color = '#1b1032',
            fg_color = '#808080',

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `inactive_tab`.
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over inactive tabs
        inactive_tab_hover = {
            bg_color = '#3b3052',
            fg_color = '#909090',
            italic = true,

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `inactive_tab_hover`.
        },

        -- The new tab button that let you create new tabs
        new_tab = {
            bg_color = '#1b1032',
            fg_color = '#808080',

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `new_tab`.
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over the new tab button
        new_tab_hover = {
            bg_color = '#3b3052',
            fg_color = '#909090',
            italic = true,

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `new_tab_hover`.
        },
    },
}

-- config.window_background_image = '/Users/daniel.veremchuk/.dotfiles/assets/images/intruder2.png'
-- config.window_background_image_hsb = {
--   -- Darken the background image by reducing it to 1/3rd
--   brightness = 0.3,

--   -- You can adjust the hue by scaling its value.
--   -- a multiplier of 1.0 leaves the value unchanged.
--   hue = 1.0,

--   -- You can adjust the saturation also.
--   saturation = 1.0,
-- }
-- config.window_background_opacity = 0.3
config.macos_window_background_blur = 8

config.background = {
    {
        source = {
            Color = '#1D1D40'
        },
        opacity = 0.9,
        width = '100%',
        height = '100%'
    },
    {
        source = {
            File = {
                path = '/Users/daniel.veremchuk/.dotfiles/assets/images/blame.jpg',
                -- speed = 0.2
            },

        },

        -- aptions: 'Fixed' | 'Scroll' | { Parallax = 0.1 }
        attachment = 'Fixed',

        -- options: 'Repeat' | 'Mirror' | 'NoRepeat'
        repeat_x = 'NoRepeat', 
        repeat_y = 'NoRepeat',
        repeat_x_size = '100%',
        repeat_y_size = '50%',

        -- options: '10cell' | '100%' | 100 (in pixels)
        -- repeat_x_size
        -- repeat_y_size

        -- options: 'Top' | 'Middle' | 'Bottom'
        vertical_align = 'Top',
        -- options: 'Left' | 'Center' | 'Right'
        horizontal_align = 'Right',

        -- options: '10cell' | '100%' | 100 (in pixels)
        -- vertical_offset = '0%',
        -- horizontal_offset = '5%',

        -- options: 'Cover' | 'Contain' | '10cell' | '100%' | 100 (in pixels)
        -- width = '57.1428%',
        -- width = 'Contain',
        width = 'Cover',
        height = 'Cover',
        -- height = 'Contain',
        -- height = 'Contain',

        hsb = {
            hue = 1.0,
            saturation = 1.0,
            brightness = 0.3
        },
        opacity = 0.5
    },
    {
        source = {
            Color = '#1D1D40'
        },
        hsb = {
            hue = 1.0,
            saturation = 1.0,
            brightness = 0.9
        },
        opacity = 0.9,
        width = '100%',
        height = '100%'
    },
}

return config

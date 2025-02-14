local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local action = wezterm.action
-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.color_scheme = 'catppuccin_mocha'
config.front_end = "WebGpu"
config.max_fps = 90
config.font_size = 18
-- config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true

-- size of initial window:
config.initial_rows = 40
config.initial_cols = 130

-- background window opacity
config.window_background_opacity = 1
config.window_background_image = '/Users/joshuayu/Pictures/Backgrounds/abyss.jpeg'
config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.10,
  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,
  -- You can adjust the saturation also.
  saturation = 0.7,
}

config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.4
}


-- key assignments
config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab

  {
    key = 'l',
    mods = 'CMD',
    action = action { ActivatePaneDirection = "Next" }
  },

  {
    key = 'L',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'P',
    mods = 'CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'z',
    mods = 'CMD',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'Backspace',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'LeftArrow',
    mods = 'SUPER',
    action = action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'SUPER',
    action = action.AdjustPaneSize { 'Down', 1 },
  },
  {
    key = 'UpArrow',
    mods = 'SUPER',
    action = action.AdjustPaneSize { 'Up', 1 }
  },
  {
    key = 'RightArrow',
    mods = 'SUPER',
    action = action.AdjustPaneSize { 'Right', 5 },
  },

  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.Multiple {
      wezterm.action.ClearScrollback 'ScrollbackAndViewport',
      wezterm.action.SendKey { key = 'L', mods = 'CTRL' },
    },
  },
  { key = 'k', mods = 'CMD|SHIFT', action = action.ScrollByLine(-4) },
  { key = 'j', mods = 'CMD|SHIFT', action = action.ScrollByLine(4) },
  {
    key = 'r',
    mods = 'CMD',
    action = action.RotatePanes 'CounterClockwise',
  }
}
-- and finally, return the configuration to wezterm
return config

local wezterm = require 'wezterm'

return {
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = .8,
  font = wezterm.font_with_fallback { 'Iosevka Term', 'Font Awesome 6 Free Regular', 'Font Awesome 6 Free Solid' },
  font_size = 14,
}

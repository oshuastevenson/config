local wezterm = require 'wezterm';

local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

return {
	color_scheme = "Dracula",
	font = wezterm.font("Source Code Pro", {weight='Bold', italic=false}),
	font_size = 14,
    --
	-- window_background_opacity = 0.8,

	text_background_opacity = 0.95,
	default_prog = {"/usr/bin/zsh", "-l"},
	default_cwd = "/home/arch",
}

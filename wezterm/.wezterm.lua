-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- ***** THEME *****
-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "OneDark (base16)"
	else
		return "OneLight (base16)"
	end
end

-- config.color_scheme = scheme_for_appearance(get_appearance())
config.color_scheme = "OneDark (base16)"

-- ***** END THEME *****

config.adjust_window_size_when_changing_font_size = false
config.cursor_blink_rate = 0
config.font_size = 13
config.line_height = 1.1
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_padding = {
	left = "2cell",
	right = "2cell",
	top = "0.5cell",
	bottom = "0.5cell",
}
config.use_resize_increments = true

-- DEFAULT WINDOW SIZE
config.initial_rows = 35
config.initial_cols = 118

-- DEFAULT START FOLDER
config.default_cwd = wezterm.home_dir .. "/Projects"

-- NO QUIT PROMPT
config.window_close_confirmation = "NeverPrompt"

-- and finally, return the configuration to wezterm
return config

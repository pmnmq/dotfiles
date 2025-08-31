local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	initial_cols = 100,
	initial_rows = 30,
	font = wezterm.font("FiraCode Nerd Font"),
	enable_tab_bar = false,
	font_size = 17,
	cursor_blink_rate = 0,
	color_scheme = "Dracula (Official)",
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 30,
		right = 20,
		top = 30,
		bottom = 30,
	},
}
-- local target = wezterm.target_triple
--
-- -- macOS 上显示 window_decorations，Linux 隐藏
-- if target:find("apple") then
-- 	config.window_decorations = "TITLE"
-- else
-- 	config.window_decorations = "NONE"
-- end

return config

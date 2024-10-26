local colours = require("colours")
local get_app_icon = require("app_icons")

sbar.add("item", "sep", {
	icon = { string = "􀆊" },
	click_script = "sketchybar --reload",
})

local front_app = sbar.add("item", {
	padding_left = 5,
	icon = {
		color = colours.TEXT_COLOUR,
		padding_left = 10,
		font = "sketchybar-app-font:Regular:16.0",
	},
	label = {
		color = colours.TEXT_COLOUR,
		padding_right = 10,
	},
	background = {
		color = colours.ITEM_BG_COLOUR1,
		border_color = colours.BORDER_COLOUR,
		border_width = 2,
	},
})

front_app:subscribe("front_app_switched", function(env)
	local icon = get_app_icon(env.INFO)
	sbar.animate("sin", 10, function()
		front_app:set({
			icon = {
				string = icon,
			},
			label = {
				string = env.INFO,
			},
		})
	end)
end)

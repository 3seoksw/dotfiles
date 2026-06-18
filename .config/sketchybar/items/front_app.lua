local colours = require("colours")
local get_app_icon = require("app_icons")

local refresher = sbar.add("item", "sep", {
	icon = {
		color = colours.TEXT_COLOUR,
		string = "􀆊",
		font = { size = 15 },
	},
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

local bar_observer_front = sbar.add("item", {
	drawing = false,
	updates = true,
})

bar_observer_front:subscribe("bar_colour_changed", function(env)
	local mode = env.MODE
	local colour = env.COLOUR
	local text_colour = colours.TEXT_COLOUR
	if mode == "transparent" then
		text_colour = colour
	end
	sbar.animate("exp", 10, function()
		front_app:set({
			icon = { color = text_colour },
			label = { color = text_colour },
		})
		refresher:set({ icon = { color = text_colour } })
	end)
end)

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

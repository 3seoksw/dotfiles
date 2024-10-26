local colours = require("colours")

local popup_toggle = "sketchybar --set $NAME popup.drawing=toggle"

local apple_logo = sbar.add("item", {
	padding_left = 15,
	padding_right = 25,
	click_script = popup_toggle,
	icon = {
		string = "􀣺 ",
		font = {
			style = "Black",
			size = 24,
		},
		color = colours.ACCENT_COLOUR,
		padding_left = 8,
		padding_right = 11,
	},
	label = {
		drawing = false,
	},
	background = {
		--color = colours.ITEM_BG_COLOUR2,
		border_color = colours.GREY,
		-- border_width = 1,
	},
	popup = {
		height = 35,
		background = {
			color = colours.ITEM_BG_COLOUR2,
			border_color = colours.IVORY,
			border_width = 1,
			corner_radius = 10,
		},
	},
})

local apple_prefs = sbar.add("item", {
	position = "popup." .. apple_logo.name,
	icon = "􀺽 ",
	label = "Preferences",
})

apple_prefs:subscribe("mouse.clicked", function()
	sbar.exec("open -a 'System Preferences'")
	apple_logo:set({ popup = { drawing = false } })
end)

apple_logo:subscribe("mouse.exited.global", function()
	apple_logo:set({ popup = { drawing = false } })
end)

apple_logo:subscribe("mouse.entered", function()
	apple_logo:set({ background = { color = colours.HOVER } })
end)
apple_logo:subscribe("mouse.exited", function()
	apple_logo:set({ background = { color = colours.ITEM_BG_COLOUR1 } })
end)

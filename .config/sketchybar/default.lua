local settings = require("settings")
local colours = require("colours")

sbar.default({
	updates = "when_shown",
	icon = {
		font = {
			family = settings.font,
			style = "Bold",
			size = 17.0,
		},
		color = colours.WHITE,
		padding_left = settings.padding,
		padding_right = settings.padding,
	},
	label = {
		font = {
			family = settings.font,
			style = "Bold",
			size = 14.0,
		},
		color = colours.WHITE,
		padding_left = settings.padding,
		padding_right = settings.padding,
	},
	background = {
		height = 25,
		corner_radius = 5,
	},
	padding_left = 10,
	padding_right = 10,
	popup = {
		align = "center",
		background = {
			color = colours.ITEM_BG_COLOUR2,
			border_color = colours.IVORY,
			border_width = 1,
			corner_radius = 10,
		},
	},
})

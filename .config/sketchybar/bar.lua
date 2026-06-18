local colours = require("colours")
local bar_observer = require("bar_observer")

sbar.bar({
	topmost = "window",
	height = 24,
	color = colours.BAR_COLOUR,
	position = "top",
	padding_right = 10,
	padding_left = 10,
})

bar_observer.init()

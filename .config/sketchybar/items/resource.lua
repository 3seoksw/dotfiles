local colours = require("colours")
local ram, ram_percent = require("items.ram")
local cpu, cpu_percent = require("items.cpu")

local resource_icon = sbar.add("item", {
	position = "right",
	padding_right = -10,
	icon = {
		string = "󰍛",
		color = colours.RED,
		font = { size = 22 },
	},
})

local resource_bracket = sbar.add("bracket", {
	resource_icon.name,
	cpu.name,
	cpu_percent.name,
	ram.name,
	ram_percent.name,
}, {
	background = {
		color = colours.ITEM_BG_COLOUR1,
		border_color = colours.BORDER_COLOUR,
		border_width = 2,
	},
})

--resource_bracket:subscribe("mouse.entered", function()
--	resource_bracket:set({ background = { color = colours.HOVER } })
--end)

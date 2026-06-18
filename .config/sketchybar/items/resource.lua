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

resource_icon:subscribe("bar_colour_changed", function(env)
	local mode = env.MODE
	local curr_colour = env.COLOUR
	local colour
	if mode == "transparent" then
		colour = curr_colour
	else
		colour = colours.TEXT_COLOUR
	end
	sbar.animate("exp", 10, function()
		resource_icon:set({ icon = { color = colour } })
	end)
end)

--resource_bracket:subscribe("mouse.entered", function()
--	resource_bracket:set({ background = { color = colours.HOVER } })
--end)

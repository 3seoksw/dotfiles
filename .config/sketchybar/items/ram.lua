local colours = require("colours")

local ram_percent = sbar.add("item", "ram_percent", {
	position = "right",
	width = 0,
	label = {
		string = "??%",
		font = { size = 10, style = "Regular" },
	},
	y_offset = -6,
	update_freq = 3,
})

local ram = sbar.add("item", "ram", {
	position = "right",
	icon = {
		--string = "󰰐",
		color = colours.TEXT_COLOUR,
	},
	label = {
		string = "RAM",
		font = { style = "Bold", size = 10 },
	},
	y_offset = 6,
})

local function update_ram_usage()
	local cmd = "memory_pressure | grep 'System-wide memory free percentage:' | awk '{print $5}'"
	sbar.exec(cmd, function(memory_usage)
		ram_percent:set({ label = { string = memory_usage } })
	end)
end
update_ram_usage()

ram:subscribe("bar_colour_changed", function(env)
	local mode = env.MODE
	local curr_colour = env.COLOUR
	local colour
	if mode == "transparent" then
		colour = curr_colour
	else
		colour = colours.TEXT_COLOUR
	end
	sbar.animate("exp", 10, function()
		ram:set({ label = { color = colour } })
		ram_percent:set({ icon = { color = colour }, label = { color = colour } })
	end)
end)

ram_percent:subscribe("routine", update_ram_usage)

return ram, ram_percent

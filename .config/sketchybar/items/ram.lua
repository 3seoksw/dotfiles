local colours = require("colours")

local ram_percent = sbar.add("item", "ram_percent", {
	position = "right",
	width = 0,
	label = {
		string = "??%",
		font = { size = 11, style = "Regular" },
	},
	y_offset = -7,
	update_freq = 3,
})

local ram = sbar.add("item", "ram", {
	position = "right",
	icon = {
		--string = "󰰐",
		color = colours.RED,
	},
	label = {
		string = "RAM",
		font = { style = "Bold", size = 11 },
	},
	y_offset = 7,
})

local function update_ram_usage()
	local cmd = "memory_pressure | grep 'System-wide memory free percentage:' | awk '{print $5}'"
	sbar.exec(cmd, function(memory_usage)
		ram_percent:set({ label = { string = memory_usage } })
	end)
end
update_ram_usage()

ram_percent:subscribe("routine", update_ram_usage)

return ram, ram_percent

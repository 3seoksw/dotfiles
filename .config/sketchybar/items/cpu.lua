local colours = require("colours")

local cpu_percent = sbar.add("item", "cpu_percent", {
	position = "right",
	width = 0,
	label = {
		string = "??%",
		font = { size = 11, style = "Regular" },
	},
	y_offset = -8,
	update_freq = 1,
})
local cpu = sbar.add("item", "cpu", {
	position = "right",
	icon = {
		--string = "󰍛",
		color = colours.RED,
	},
	label = {
		string = "CPU",
		font = { style = "Bold", size = 11 },
	},
	y_offset = 7,
})

local function update_cpu_usage()
	sbar.exec("top -l 1 | grep 'CPU usage' | awk '{user=$3; sys=$5; print user+sys}'", function(cpu_usage)
		local label = tostring(math.floor(cpu_usage + 0.5))
		cpu_percent:set({ label = { string = label .. "%" } })
	end)
end
update_cpu_usage()

cpu_percent:subscribe("routine", update_cpu_usage)

return cpu, cpu_percent

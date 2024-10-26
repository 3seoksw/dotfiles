local colours = require("colours")

local battery = sbar.add("item", {
	icon = {
		padding_left = 10,
	},
	label = {
		padding_right = 10,
	},
	background = {
		color = colours.ITEM_BG_COLOUR1,
		border_color = colours.BORDER_COLOUR,
		border_width = 2,
		padding_right = 10,
	},
	position = "right",
	update_freq = 120,
})

local function battery_update()
	sbar.exec("pmset -g batt", function(batt_info)
		local colour = colours.YELLOW
		local icon = "!"
		local label = "?"
		local found, _, charge = batt_info:find("(%d+)%%")

		if found then
			charge = tonumber(charge)
			label = charge .. "%"
		end

		if string.find(batt_info, "AC Power") then
			icon = "􀢋 "
			colour = colours.GREEN
		else
			if found and charge > 80 then
				icon = "􀛨 "
				colour = colours.GREEN
			elseif found and charge > 60 then
				icon = "􀺸 "
				colour = colours.GREEN
			elseif found and charge > 40 then
				icon = "􀺶 "
				colour = colours.YELLOW
			elseif found and charge > 20 then
				icon = "􀛩 "
				colour = colours.RED
			else
				icon = "􀛪 "
				colour = colours.RED
			end
		end

		battery:set({ icon = { string = icon, color = colour }, label = label })
	end)
end

battery:subscribe({ "routine", "power_source_change", "system_woke" }, battery_update)

local colours = require("colours")

local volume_percent = sbar.add("item", "volume_percent", {
	position = "right",
	icon = { drawing = false },
})

local volume_icon = sbar.add("item", "volume_icon", {
	position = "right",
	padding_left = 0,
	padding_right = 0,
	icon = { color = colours.THIRD_COLOUR },
})

local volume_bracket = sbar.add("bracket", "volume_bracket", {
	volume_icon.name,
	volume_percent.name,
}, {
	background = {
		color = colours.ITEM_BG_COLOUR1,
		border_color = colours.BORDER_COLOUR,
		border_width = 2,
	},
})

volume_percent:subscribe("volume_change", function(env)
	local volume = tonumber(env.INFO)
	local icon = "􀊣 "
	local colour = colours.ORANGE
	if volume > 60 then
		icon = "􀊩 "
	elseif volume > 30 then
		icon = "􀊧 "
	elseif volume > 10 then
		icon = "􀊥 "
	elseif volume > 0 then
		icon = "􀊡 "
	end

	local lead = ""
	if volume < 10 then
		lead = "0"
	end

	volume_icon:set({ label = { string = icon, color = colour } })
	volume_percent:set({ label = lead .. volume .. "%" })
end)

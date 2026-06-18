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

local bar_observer_vol = sbar.add("item", {
	drawing = false,
	updates = true,
})

bar_observer_vol:subscribe("bar_colour_changed", function(env)
	local mode = env.MODE
	local curr_colour = env.COLOUR
	local colour
	if mode == "transparent" then
		colour = curr_colour
	else
		colour = colours.TEXT_COLOUR
	end
	sbar.animate("exp", 10, function()
		volume_icon:set({ label = { color = colour } })
		volume_percent:set({ label = { color = colour } })
	end)
end)

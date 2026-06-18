local colours = require("colours")
local M = {}

M.bar_colour = colours.BAR_COLOUR
M.transparent = colours.TRANSPARENT
M.event = "bar_colour_changed"

local function trigger(mode, colour)
	sbar.exec(string.format("sketchybar --trigger %s MODE=%s COLOUR=%s", M.event, mode, colour))
end

function M.init()
	sbar.exec("sketchybar --add event " .. M.event)
end

function M.set_colour(mode, colour)
	-- sbar.exec("sketchybar --animate exp 30 --bar color=" .. colour)
	trigger(mode, colour)
end

function M.toggle()
	sbar.exec("sketchybar --query bar", function(bar_query)
		local colour = bar_query.color
		local transparent = colours.TRANSPARENT
		local is_transparent = (colour == transparent or colour == "0x0")

		if is_transparent then
			-- M.set_colour("normal", colours.BAR_COLOUR)
			trigger("normal", colours.BAR_COLOUR)
		else
			-- M.set_colour("transparent", colours.TRANSPARENT)
			trigger("transparent", colours.TRANSPARENT)
		end
	end)
end

return M

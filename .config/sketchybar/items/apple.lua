local colours = require("colours")
local spaces = require("items.spaces")
local bar_observer = require("bar_observer")

local apple_logo = sbar.add("item", {
	padding_left = 15,
	padding_right = 25,
	-- click_script = popup_toggle,
	icon = {
		string = "􀣺 ",
		font = {
			style = "Black",
			size = 16.5,
			-- size = 24,
		},
		color = colours.ACCENT_COLOUR,
		padding_left = 8,
		padding_right = 11,
	},
	label = {
		drawing = false,
	},
	background = {
		--color = colours.ITEM_BG_COLOUR2,
		border_color = colours.GREY,
		-- border_width = 1,
	},
	popup = {
		height = 35,
		background = {
			color = colours.ITEM_BG_COLOUR2,
			border_color = colours.IVORY,
			border_width = 1,
			corner_radius = 10,
		},
	},
})

local function toggle_transparency()
	sbar.exec("sketchybar --query bar", function(bar_query)
		local colour = bar_query.color
		local transparent = colours.TRANSPARENT
		local is_transparent = (colour == transparent or colour == "0x0")

		if is_transparent then
			sbar.exec("sketchybar --bar color=" .. colours.BAR_COLOUR, function()
				spaces.update_workspaces()
			end)
		else
			sbar.exec("sketchybar --bar color=" .. colours.TRANSPARENT, function()
				spaces.update_workspaces()
			end)
		end
	end)
end

apple_logo:subscribe("mouse.clicked", function()
	toggle_transparency()
	bar_observer.toggle()
end)

apple_logo:subscribe("mouse.exited.global", function()
	apple_logo:set({ popup = { drawing = false } })
end)

apple_logo:subscribe("mouse.entered", function()
	apple_logo:set({ background = { color = colours.HOVER } })
end)
apple_logo:subscribe("mouse.exited", function()
	apple_logo:set({ background = { color = colours.ITEM_BG_COLOUR1 } })
end)

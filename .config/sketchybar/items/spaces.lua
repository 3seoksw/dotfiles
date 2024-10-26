local colours = require("colours")
local get_app_icon = require("app_icons")

local AERO = "/usr/local/bin/aerospace"
local LIST_WORKSPACES_ALL = AERO .. " list-workspaces --all"
local LIST_CURRENT = AERO .. " list-workspaces --focused"
local LIST_APPS = AERO .. " list-windows --workspace %s | awk -F'|' '{gsub(/^ *| *$/, \"\", $2); print $2}'"

local spaces = {}

local function update_space_icons(workspace_id)
	local icon_strip = ""

	sbar.exec(LIST_APPS:format(workspace_id), function(apps)
		local app_found = false

		for app in apps:gmatch("[^\r\n]+") do
			local app_name = app:match("^%s*(.-)%s*$")
			if app_name and app_name ~= "" then
				icon_strip = icon_strip .. " " .. get_app_icon(app_name)
				app_found = true
			end
		end

		if not app_found then
			icon_strip = " —"
		end

		if spaces[workspace_id] then
			sbar.animate("sin", 5, function()
				spaces[workspace_id]:set({
					label = { string = icon_strip, drawing = true },
				})
			end)
		else
			print("Warning: Space ID '" .. workspace_id .. "' not found when updating icons.")
		end
	end)
end

local function update_workspaces()
	sbar.exec(LIST_CURRENT, function(focused)
		local focused_workspace = focused:match("[^\r\n]+")
		sbar.exec(LIST_WORKSPACES_ALL, function(workspaces)
			for workspace_id in workspaces:gmatch("[^\r\n]+") do
				local space = spaces[workspace_id]
				local selected = focused_workspace == workspace_id
				local colour = (selected and colours.TEXT_COLOUR) or colours.GREY

				update_space_icons(workspace_id)

				sbar.animate("exp", 5, function()
					space:set({
						icon = { color = colour },
						label = { color = colour },
					})
				end)
			end
		end)
	end)
end

sbar.exec(LIST_WORKSPACES_ALL, function(workspaces)
	local workspaces_ids = {}
	for workspace_id in workspaces:gmatch("[^\r\n]+") do
		if not spaces[workspace_id] then
			local space = sbar.add("space", "space_" .. workspace_id, {
				space = workspace_id,
				icon = { string = workspace_id },
				label = {
					font = "sketchybar-app-font:Regular:16.0",
					padding_right = 20,
					y_offset = -1,
				},
				click_script = AERO .. " workspace " .. workspace_id,
			})

			space:subscribe("mouse.entered", function()
				space:set({ background = { color = colours.HOVER } })
			end)
			space:subscribe("mouse.exited", function()
				space:set({ background = { color = colours.ITEM_BG_COLOUR1 } })
			end)

			spaces[workspace_id] = space
			table.insert(workspaces_ids, space.name)
		end
	end

	sbar.add("bracket", workspaces_ids, {
		background = {
			color = colours.ITEM_BG_COLOUR1,
			border_color = colours.BORDER_COLOUR,
			border_width = 2,
		},
	})

	require("items.front_app")
	update_workspaces()
end)

local space_window_observer = sbar.add("item", {
	drawing = false,
	updates = true,
})

space_window_observer:subscribe("system_woke", function()
	update_workspaces()
end)

space_window_observer:subscribe("aerospace_workspace_change", function()
	update_workspaces()
end)

space_window_observer:subscribe("front_app_switched", function()
	update_workspaces()
end)

space_window_observer:subscribe("space_windows_change", function()
	update_workspaces()
end)

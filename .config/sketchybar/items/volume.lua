local colours = require("colours")

local popup_width = 250
local slider_width = popup_width - 30

local volume_settings = sbar.add("item", "volume_settings", {
	position = "right",
	icon = {
		string = "􀝎 ",
		color = colours.YELLOW,
		font = {
			size = 12.0,
		},
		padding_left = 10,
		padding_right = 12,
	},
	label = { drawing = false },
	padding_left = 2,
	padding_right = 0,
})

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
	volume_settings.name,
}, {
	background = {
		color = colours.ITEM_BG_COLOUR1,
		border_color = colours.BORDER_COLOUR,
		border_width = 2,
	},
	popup = {
		align = "center",
		background = {
			color = colours.ITEM_BG_COLOUR2,
			border_color = colours.IVORY,
			border_width = 1,
			corner_radius = 10,
		},
	},
})

sbar.add("item", {
	position = "popup." .. volume_bracket.name,
	label = {
		string = "Sound",
		color = colours.ORANGE,
		font = {
			style = "Bold",
			size = 16.0,
		},
	},
})
local volume_slider = sbar.add("slider", slider_width, {
	position = "popup." .. volume_bracket.name,
	width = popup_width,
	align = "center",
	updates = true,
	icon = { drawing = false },
	slider = {
		highlight_color = colours.WHITE,
		background = {
			height = 12,
			corner_radius = 10,
			color = colours.GREY,
		},
		--knob = {
		--	string = "􀀁 ",
		--	drawing = false,
		--	background = { color = colours.GREY, corner_radius = 10 },
		--},
	},
	click_script = 'osascript -e "set volume output volume $PERCENTAGE"',
})

sbar.add("item", {
	position = "popup." .. volume_bracket.name,
	width = popup_width,
	label = { drawing = false },
	icon = { drawing = false },
	background = {
		height = 1,
		color = colours.IVORY,
	},
})

sbar.add("item", "volume_panel", {
	position = "popup." .. volume_bracket.name,
	width = popup_width,
	align = "left",
	label = {
		string = "Audio Sources",
		color = colours.ORANGE,
		font = {
			style = "Bold",
			size = 16.0,
		},
	},
})

local function animate_slider_width(width)
	sbar.animate("tanh", 30.0, function()
		volume_slider:set({ slider = { width = width } })
	end)
end

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
	volume_slider:set({ slider = { percentage = volume } })
end)

local function volume_collapse_details()
	local drawing = volume_bracket:query().popup.drawing == "on"
	if not drawing then
		return
	end
	volume_bracket:set({ popup = { drawing = false } })
	sbar.remove("/volume.device\\.*/")
end

local current_audio_device = "None"
local function volume_toggle_details(env)
	if env.BUTTON == "right" then
		sbar.exec("open /System/Library/PreferencePanes/Sound.prefpane")
		return
	end

	local should_draw = volume_bracket:query().popup.drawing == "off"
	if should_draw then
		volume_bracket:set({ popup = { drawing = true } })
		sbar.exec("SwitchAudioSource -t output -c", function(result)
			current_audio_device = result:sub(1, -2)
			sbar.exec("SwitchAudioSource -a -t output", function(available)
				current = current_audio_device
				local colour = colours.GREY
				local counter = 0

				for device in string.gmatch(available, "[^\r\n]+") do
					local colour = colours.GREY
					if current == device then
						colour = colours.WHITE
					end
					sbar.add("item", "volume_device_" .. counter, {
						position = "popup." .. volume_bracket.name,
						width = popup_width,
						align = "left",
						background = { color = colours.ITEM_BG_COLOUR1 },
						label = { string = device, color = colour },
						click_script = 'SwitchAudioSource -s "'
							.. device
							.. '" && sketchybar --set /volume.device\\.*/ label.color='
							.. colours.GREY
							.. " --set $NAME label.color="
							.. colours.WHITE,
					})
					counter = counter + 1
				end
			end)
		end)
	else
		volume_collapse_details()
	end
end

--volume_icon:subscribe("mouse.clicked", function()
--	if tonumber(volume_slider:query().slider.width) > 0 then
--		animate_slider_width(0)
--	else
--		animate_slider_width(slider_width)
--	end
--end)
--volume_percent:subscribe("mouse.clicked", function()
--	if tonumber(volume_slider:query().slider.width) > 0 then
--		animate_slider_width(0)
--	else
--		animate_slider_width(slider_width)
--	end
--end)
--volume_slider:subscribe("mouse.entered", function()
--	volume_slider:set({ slider = { knob = { drawing = true } } })
--end)
--volume_slider:subscribe("mouse.exited", function()
--	volume_slider:set({ slider = { knob = { drawing = false } } })
--end)

volume_settings:subscribe("mouse.clicked", volume_toggle_details)
volume_settings:subscribe("mouse.exited.global", volume_collapse_details)

volume_settings:subscribe("mouse.entered", function()
	volume_settings:set({ background = { color = colours.HOVER } })
end)
volume_settings:subscribe("mouse.exited", function()
	volume_settings:set({ background = { color = colours.ITEM_BG_COLOUR1 } })
end)

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

sbar.add("item", {
	position = "popup." .. volume_settings.name,
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
	position = "popup." .. volume_settings.name,
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
	position = "popup." .. volume_settings.name,
	width = popup_width,
	label = { drawing = false },
	icon = { drawing = false },
	background = {
		height = 1,
		color = colours.IVORY,
	},
})

local media = sbar.add("item", {
	position = "popup." .. volume_settings.name,
	icon = {
		padding_left = 60,
		y_offset = 10,
		max_chars = 27,
		scroll_duration = 200,
		font = { size = 13 },
		width = 0,
	},
	label = {
		padding_left = 60,
		y_offset = -10,
		max_chars = 30,
		scroll_duration = 200,
		font = { style = "Regular", size = 11 },
	},
	scroll_texts = true,
	padding_left = 15,
	background = {
		image = {
			drawing = true,
			string = "media.artwork",
			scale = 1.5,
			corner_radius = 3,
		},
		color = colours.ACCENT_COLOUR,
	},
	width = 0,
})

local media_border = sbar.add("item", "media_border", {
	position = "popup." .. volume_settings.name,
	width = popup_width,
	label = { drawing = false },
	icon = { drawing = false },
	background = {
		height = 1,
		color = colours.IVORY,
	},
})

sbar.add("item", "volume_panel", {
	position = "popup." .. volume_settings.name,
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

local function volume_collapse_details()
	local drawing = volume_settings:query().popup.drawing == "on"
	if not drawing then
		return
	end
	volume_settings:set({ popup = { drawing = false } })
	sbar.remove("/volume.device\\.*/")
end

local current_audio_device = "None"
local function volume_toggle_details(env)
	if env.BUTTON == "right" then
		sbar.exec("open /System/Library/PreferencePanes/Sound.prefpane")
		return
	end

	local should_draw = volume_settings:query().popup.drawing == "off"
	if should_draw then
		volume_settings:set({ popup = { drawing = true } })
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
						position = "popup." .. volume_settings.name,
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

volume_settings:subscribe("mouse.clicked", volume_toggle_details)
volume_settings:subscribe("mouse.exited.global", volume_collapse_details)

volume_settings:subscribe("mouse.entered", function()
	volume_settings:set({ background = { color = colours.HOVER } })
end)
volume_settings:subscribe("mouse.exited", function()
	volume_settings:set({ background = { color = colours.ITEM_BG_COLOUR1 } })
end)

volume_settings:subscribe("volume_change", function(env)
	local volume = tonumber(env.INFO)
	volume_slider:set({ slider = { percentage = volume } })
end)

volume_settings:subscribe("media_change", function(env)
	media:set({
		drawing = (env.INFO.state == "playing") and true or false,
		icon = env.INFO.title,
		label = env.INFO.artist .. " - " .. env.INFO.album,
	})
	media_border:set({
		drawing = (env.INFO.state == "playing") and true or false,
	})
end)

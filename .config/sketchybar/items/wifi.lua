local colours = require("colours")

local wifi_upload = sbar.add("item", "wifi_upload", {
	position = "right",
	--width = 0,
	padding_left = -5,
	icon = {
		width = "dynamic",
		string = "􀄨 ",
		font = {
			size = 9,
		},
	},
	label = {
		width = "dynamic",
		string = "000 Mbps",
		font = 9,
	},
	--y_offset = 5,
	update_freq = 5,
})

--local wifi_download = sbar.add("item", "wifi_download", {
--	position = "right",
--	padding_left = -5,
--	icon = {
--		width = "dynamic",
--		string = "􀄩 ",
--		font = {
--			size = 7,
--		},
--	},
--	label = {
--		width = "dynamic",
--		string = "000 Mbps",
--		font = 7,
--	},
--	y_offset = -6,
--})

local function animate_wifi_info(width)
	sbar.animate("sin", 20, function()
		wifi_upload:set({
			icon = { width = width },
			label = { width = width },
		})
		--wifi_download:set({
		--	icon = { width = width },
		--	label = { width = width },
		--})
	end)
end

local function toggle_wifi_info()
	local should_draw = wifi_upload:query().icon.width == 0

	if should_draw then
		animate_wifi_info("dynamic")
	else
		animate_wifi_info(0)
	end
end
toggle_wifi_info()

local wifi = sbar.add("item", "wifi", {
	position = "right",
	padding_left = 12,
	icon = {
		color = colours.SECOND_COLOUR,
	},
})

local wifi_bracket = sbar.add("bracket", {
	wifi.name,
	wifi_upload.name,
	--wifi_download.name,
}, {
	background = {
		color = colours.ITEM_BG_COLOUR1,
		border_color = colours.BORDER_COLOUR,
		border_width = 2,
	},
})

local function update_wifi_stat()
	-- TX_Rate
	sbar.exec("system_profiler SPAirPortDataType | grep 'Transmit Rate' | awk '{print $3}'", function(tx_rate)
		local label = "000"
		if tonumber(tx_rate) < 100 then
			label = "0" .. tx_rate
		else
			label = tx_rate
		end
		wifi_upload:set({ label = { string = label .. " Mbps" } })
	end)
	-- RX_Rate
	--sbar.exec("netstat -ibn | grep -m 1 -e en0 | awk '{print $7}'", function(init_bytes)
	--	sbar.exec("sleep 3", function()
	--		sbar.exec("netstat -ibn | grep -m 1 -e en0 | awk '{print $7}'", function(final_bytes)
	--			local rx_rate = final_bytes - init_bytes
	--			local rx_rate_bps = rx_rate * 8
	--			local rx_rate_Mbps = rx_rate_bps / 1000000
	--			--wifi_download:set({ label = { string = rx_rate_Mbps } })
	--		end)
	--	end)
	--end)
	--local upload = os.execute(string.format("echo %s | grep 'Tx Rate' | sed 's/.*Tx Rate.*: //'", current_wifi))
	--print(upload)

	--wifi_download:set({ label = { string = download } })
end

wifi:subscribe({ "wifi_change", "system_woke", "forced" }, function(env)
	local icon = "􀙈 "
	local label = "Disconnected"
	sbar.exec("ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}'", function(ssid)
		if ssid ~= "" then
			icon = "􀙇 "
			label = ssid
		end
		wifi:set({ icon = { string = icon }, label = { string = label } })
	end)
end)

wifi_bracket:subscribe("mouse.entered", function()
	wifi_bracket:set({ background = { color = colours.HOVER } })
end)
wifi_bracket:subscribe("mouse.exited", function()
	wifi_bracket:set({ background = { color = colours.ITEM_BG_COLOUR1 } })
end)

wifi_upload:subscribe("routine", update_wifi_stat)
--wifi:subscribe("netstat_update", function(env)
--	local upload = env.UPLOAD * 8 / 1000000
--	local download = env.DOWNLOAD * 8 / 1000000
--	wifi_upload:set({ label = { string = upload } })
--	wifi_download:set({ label = { string = download } })
--	--print(env.DOWNLOAD, env.UPLOAD)
--end)

wifi:subscribe("mouse.clicked", toggle_wifi_info)

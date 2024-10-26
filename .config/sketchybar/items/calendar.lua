local colours = require("colours")

local cal = sbar.add("item", {
	icon = {
		color = colours.ACCENT_COLOUR,
		padding_left = 10,
	},
	label = {
		padding_right = 10,
		align = "right",
	},
	background = {
		color = colours.ITEM_BG_COLOUR1,
		border_color = colours.BORDER_COLOUR,
		border_width = 2,
	},
	position = "right",
	update_freq = 15,
})

local function update()
	local icon = "󰃰 "
	local time = os.date("%a. %d %b. %H:%M")
	cal:set({ icon = icon, label = time })
end

local function is_leap_year(year)
	return (year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0)
end

local function days_in_month(month, year)
	local days = { 31, is_leap_year(year) and 29 or 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
	return days[month]
end

local function draw_calendar()
	local current_year = tonumber(os.date("%Y"))
	local current_month = tonumber(os.date("%m"))
	local current_day = tonumber(os.date("%d"))
	local first_day_of_month = os.time({ year = current_year, month = current_month, day = 1 })
	local first_weekday = tonumber(os.date("%w", first_day_of_month))
	local days_in_current_month = days_in_month(current_month, current_year)

	print(string.format("%s %s", os.date("%B"), current_year))
	print("Sun\tMon\tTue\tWed\tThu\tFri\tSat")

	for i = 1, first_weekday do
		io.write("\t")
	end

	for day = 1, days_in_current_month do
		if day == current_day then
			io.write(string.format("[%2d]", day) .. "\t")
		else
			io.write(string.format("%2d\t", day))
		end

		if (first_weekday + day) % 7 == 0 then
			print() -- New line
		end
	end
	print()
end

cal:subscribe("routine", update)
cal:subscribe("forced", update)
cal:subscribe("mouse.clicked", draw_calendar)

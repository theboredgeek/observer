-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly
-- hl.monitor({
--     output    = "MONITOR1",
--     mode      = "1920x1080@60",
--     position  = "0x0",
--     scale     = "1",
-- })

hl.monitor({
    output    = "DP-1",
    mode      = "3440x1440@180.00",
    position  = "0x0",
    scale     = "1",
})

hl.monitor({
	output	 = "DP-2",
	mode	 = "1920x1080 @60.00",
	position = "3440x0",
	scale	 = "1",
})

hl.monitor({
	output	 = "DP-3",
	mode	 = "1920x1080@60.00",
	position = "5360x0",
	scale	 = "1",
})

hl.monitor({
	output	 = "HDMI-A-1",
	mode	 = "1920x1080@60.00",
	position = "7280x0",
	scale	 = "1",
})

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60.00",
    position = "0x0",
    scale    = "1",
})

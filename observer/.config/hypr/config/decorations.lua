hl.config({
    general = {
        gaps_in = 12,
        gaps_out = 20,
        border_size = 0,
        extend_border_grab_area = 10,
        resize_on_border = true,
        col = {
            active_border = {
                colors = { CACHYLGREEN, CACHYDGREEN },
                angle = 60,
            },
            inactive_border = CACHYGRAY,
        },
    },
    group = {
        col = {
            border_active = CACHYLBLUE,
            border_inactive = CACHYGRAY,
            border_locked_active = CACHYDBLUE,
            border_locked_inactive = CACHYGRAY,
        },
        groupbar = {
            col = {
                active = CACHYLGREEN,
                inactive = CACHYGRAY,
                locked_active = CACHYDBLUE,
                locked_inactive = CACHYGRAY,
            },
        },
    },
    decoration = {
        dim_special = 0.3,
        rounding = 6,
        active_opacity = 0.95,
        inactive_opacity = 0.80,
        fullscreen_opacity = 1,
        blur = {
            size = 3,
            passes = 3,
            special = true,
        },
        shadow = {
        enabled = true,
        range = 40,           -- Large range for a soft fade
        render_power = 4,     -- Maximum falloff/softness
        color = "rgba(000000bb)", -- Subtle translucent black
        },
    }, 
}) -- CLEANLY CLOSES THE MAIN CONFIG HERE

-- Now, run the plugin initialization entirely outside the table block
if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass
    hg.config({
        enabled = true,
        default_theme = "dark",
        default_preset = "clear",
        
        -- The actual valid keys for tinting and glass density:
        tint_color = 0x00000033,    -- Hex color with low alpha (0xRRGGBBAA)
        brightness = 0.9,           -- Pushes lighting levels underneath the window
        
        dark = {
            brightness = 0.82,      -- Dark mode specific depth tuning
        }
    })
end

-- Hyprland default apps

-- Universal Application Defaults
TERMINAL = "kitty"
FILE_MANAGER = "dolphin"
EDITOR = "nvim"
BROWSER = "firefox"
NUM_WPM = 5

-- Dynamic Hardware Configuration based on Hostname
local hostname = io.popen("uname -n"):read("*l")

if hostname == "blade03" then
    -- Laptop configuration (blade03): Targets are workspaces
    MONITOR1 = "eDP-1"
    MONITOR2 = "eDP-1"
    MONITOR3 = "eDP-1"
    MONITOR4 = "eDP-1"
    TARGET_1 = { workspace = "1" }
    TARGET_2 = { workspace = "2" }
    TARGET_3 = { workspace = "3" }
    TARGET_4 = { workspace = "4" }
else
    -- Desktop configuration: Targets are monitors
    MONITOR1 = "HDMI-A-1"     -- Adjust to your primary desktop monitor name if needed
    MONITOR2 = "DP-1"
    MONITOR3 = "DP-2"
    MONITOR4 = "DP-3"
    TARGET_1 = { monitor = MONITOR1 }
    TARGET_2 = { monitor = MONITOR2 }
    TARGET_3 = { monitor = MONITOR3 }
    TARGET_4 = { monitor = MONITOR4 }
end

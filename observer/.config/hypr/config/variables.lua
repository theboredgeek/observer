-- Hyprland default apps

TERMINAL     = "kitty"
FILE_MANAGER = "dolphin"
BROWSER      = "firefox"
EDITOR       = "gnome-text-editor --new-window"
CALCULATOR   = "gnome-calculator"

-- Monitors
local hostname = io.popen("uname -n"):read("*l")

if hostname == "your-laptop-hostname" then
    -- Fallback variables for your laptop so global references don't crash
    MONITOR1 = "eDP-1"
    MONITOR2 = "eDP-1"
    MONITOR3 = "eDP-1"
    PRIMARY_MONITOR = "eDP-1"
else
    -- Your desktop variables
    MONITOR1 = "DP-1"
    MONITOR2 = "DP-2"
    MONITOR3 = "DP-3"
    PRIMARY_MONITOR = "DP-1"
end

-- Workspaces
NUM_WPM = 3 -- Number of workspaces per monitor (Max 10)

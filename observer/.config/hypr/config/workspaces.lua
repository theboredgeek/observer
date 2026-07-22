local hostname = io.popen("uname -n"):read("*l")

-- Set the target monitor variable based on the machine
local target_monitor
if hostname == "blade03" then
    target_monitor = "eDP-1"
else
    target_monitor = "DP-1" -- Matches your desktop MONITOR1
end

-- Apply the rules using the dynamic monitor variable
hl.workspace_rule({ workspace = "1", monitor = target_monitor, default = true, persistent = true })
hl.workspace_rule({ workspace = "2", monitor = target_monitor, default = true, persistent = true })
hl.workspace_rule({ workspace = "3", monitor = target_monitor, default = true, persistent = true })

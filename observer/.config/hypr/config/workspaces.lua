local hostname = io.popen("uname -n"):read("*l")

if hostname == "blade03" then
    -- Laptop: Unbind specific monitors so workspaces pool naturally on eDP-1
    hl.workspace_rule({ workspace = "1", default = true, persistent = true })
    hl.workspace_rule({ workspace = "2", persistent = true })
    hl.workspace_rule({ workspace = "3", persistent = true })
else
    -- Desktop: Keep your multi-monitor bindings using MONITOR1
    hl.workspace_rule({ workspace = "1", monitor = MONITOR1, default = true, persistent = true })
    hl.workspace_rule({ workspace = "2", monitor = MONITOR1, default = true, persistent = true })
    hl.workspace_rule({ workspace = "3", monitor = MONITOR1, default = true, persistent = true })
end

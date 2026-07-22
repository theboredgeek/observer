local hostname = io.popen("uname -n"):read("*l")

if hostname == "your-laptop-hostname" then
    -- Laptop: Completely remove monitor bindings so workspaces pool on eDP-1 naturally
    hl.workspace_rule({ workspace = "1", default = true, persistent = true })
    hl.workspace_rule({ workspace = "2", persistent = true })
    hl.workspace_rule({ workspace = "3", persistent = true })
else
    -- Desktop: Keep your multi-monitor hardware locks
    hl.workspace_rule({ workspace = "1", monitor = MONITOR1, default = true, persistent = true })
    hl.workspace_rule({ workspace = "2", monitor = MONITOR1, default = true, persistent = true })
    hl.workspace_rule({ workspace = "3", monitor = MONITOR1, default = true, persistent = true })
end

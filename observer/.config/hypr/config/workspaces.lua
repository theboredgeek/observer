local hostname = io.popen("uname -n"):read("*l")

if hostname == "YOUR_LAPTOP_HOSTNAME" then
    -- Laptop: Pool workspaces naturally on the laptop display
    hl.workspace_rule({ workspace = "1", default = true, persistent = true })
    hl.workspace_rule({ workspace = "2", persistent = true })
    hl.workspace_rule({ workspace = "3", persistent = true })
else
    -- Desktop: Multi-monitor hardware locks using the variables defined above
    hl.workspace_rule({ workspace = "1", monitor = MONITOR1, default = true, persistent = true })
    hl.workspace_rule({ workspace = "2", monitor = MONITOR1, default = true, persistent = true })
    hl.workspace_rule({ workspace = "3", monitor = MONITOR1, default = true, persistent = true })
end

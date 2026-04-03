source /usr/share/cachyos-fish-config/cachyos-config.fish

# Initialize Starship
starship init fish | source

# Overwrite greeting (cleans up the terminal start)
function fish_greeting
end

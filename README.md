# Observer Dotfiles
Minimal Hyprland+Noctalia Rice Tweaks

![My Desktop](./screenshots/observer_8_4_2026)
![My Desktop](./screenshots/observer_readme_neovim_fullscreen_8_4_20266)

Noctalia still does most of the heavy lifting. This "Rice" isn't anything special. Just minor aesthetic changes, and storing my configs for a few packages.

Slight visual changes after installing the default Hyprland Noctalia configs from CachyOS. Such as a brushed glass aesthetic with shadows, and 0 window borders.
Otherwise a few config tweaks for monitor setups so I can use the same dotfiles on a laptop and a 4 monitor desktop setup.
As well as a couple keybind and window rule changes in hypr/config. Kitty cursor tail visual affect, etc.

- What you see in the first screenshot is 3 Kitty terminals.
    - Left: Python interpreter
    - Right: Neovim
    - Center floating window: Yazi file browser.
- The second screenshot is Neovim in fullscreen editing this markdown file.

- Window Manager: Hyprland + Noctalia
- Shell: Fish
- Terminal: Kitty
- Editor: Neovim (Minimal setup)
    - Configured for the following languages:
        - GDscript
        - Lua
        - Markdown
    - Plus a couple git packages
- Wallpapers: Stored in /Pictures/Wallpapers.
    - Wallpapers were sourced from a few github repos created by others.

# If you want to use my dotfiles for your setup -
- The first thing you'll want to change are the Hypr lua files. Specifically the following:
    - binds.lua
        - Make sure your preferred keybinds are how you like them. (obviously)
    - environment.lua
        - If you use an AMD GPU, you'll probably want to uncomment a few lines.
    - monitors.lua
        - Obviously list all your monitors here.
    - variables.lua
        - If you plan to use these dotfiles on multiple PC's like I do, this is where you control your default apps, and different monitor setups to auto-switch between them.
        - MAKE SURE TO CHANGE THE HOST NAME OF YOUR DEVICES. Otherwise it won't auto-switch between your different PC's monitor setups.
        - This is also where you assign workspaces and how many workspaces you want.
    - workspaces.lua
        - Change your host name here as well.
    - windowrules.lua
        - If you want to override the transparency of Kitty/Firefox, etc thats in here. Otherwise keep those lines commented out so you can control them via their own configs and Hyprland's blur/transparency rules.
    - autostart.lua
        - If you don't use Solaar for your mouse, comment it out or delete it here.

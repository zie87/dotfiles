local filesystem = require('gears.filesystem')
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi

local terminal = 'kitty'
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor
local editor_gui = "code"

return {
    -- List of apps to start by default on some actions
    default = {
        terminal = terminal,
        editor = editor,
        editor_cmd = editor_cmd,
        editor_gui = editor_gui,
        browser = "firefox",
        filemanager = "thunar",
        rofi = "rofi -modi drun -show drun ".. " -dpi " .. get_dpi() .. " -width " .. with_dpi(400) .. " -theme " .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi',
    },
    -- List of apps to start once on start-up
    run_on_start_up = {
        'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf', 
        'blueberry-tray', -- Bluetooth tray icon
        'xfce4-power-manager', -- Power manager
        '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)' -- credential manager
    }
}

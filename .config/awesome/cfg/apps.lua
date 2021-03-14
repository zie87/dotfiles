local filesystem = require('gears.filesystem')
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi

local terminal = 'kitty'
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor
local editor_gui = "emacs"

local rofi_script_path =  os.getenv("HOME") .. ".config/rofi/applets/menu/"

return {
    -- List of apps to start by default on some actions
    default = {
        terminal      = terminal,
        editor        = editor,
        editor_cmd    = editor_cmd,
        editor_gui    = editor_gui,
        browser       = "firefox",
        filemanager   = "thunar",
        screen_locker = "light-locker-command -l",
    },
    runner =  {
        drun      = "rofi -modi drun -show drun " .. " -theme " .. filesystem.get_configuration_dir() .. '/cfg/rofi.rasi',
        powermenu = "/home/zie/.config/rofi/applets/menu/powermenu.sh",
        passmenu  = "passmenu -l 10"
    },
    -- List of apps to start once on start-up
    run_on_start_up = {
        -- 'picom --config ' .. filesystem.get_configuration_dir() .. '/cfg/picom.conf', 
        'light-locker', -- screen locker daemon
        '/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
        'pamac-tray', -- update checks
        'dropbox'
    }
}

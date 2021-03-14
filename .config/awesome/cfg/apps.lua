local filesystem = require('gears.filesystem')

local terminal = 'kitty'
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor
local editor_gui = "emacs"

local web_browser   = "librewolf"
local file_browser  = "thunar"
local screen_locker = "light-locker-command -l"

local rofi_script_path =  os.getenv("HOME") .. "/.config/rofi/applets/menu/"

local drun_cmd = "rofi -modi drun -show drun " .. " -theme " .. filesystem.get_configuration_dir() .. '/cfg/rofi.rasi'
local power_cmd = rofi_script_path .. "powermenu.sh"
local screenshot_cmd = rofi_script_path .. "screenshot.sh"
local pass_cmd = "passmenu -l 10"

return {
    default = {
        terminal      = terminal,
        editor        = editor,
        editor_cmd    = editor_cmd,
        editor_gui    = editor_gui,
        browser       = web_browser,
        filemanager   = file_browser,
        screen_locker = screen_locker,
    },
    runner =  {
        drun           = drun_cmd,
        powermenu      = power_cmd,
        screenshotmenu = screenshot_cmd,
        passmenu       = pass_cmd
    },
    run_on_start_up = {
        -- 'picom --config ' .. filesystem.get_configuration_dir() .. '/cfg/picom.conf',
        'light-locker', -- screen locker daemon
        '/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
        'pamac-tray', -- update checks
        'dropbox'
    }
}

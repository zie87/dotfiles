

local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

local apps = require('cfg.apps')

local open_awesome_cfg = apps.default.editor_cmd .. " " .. awesome.conffile 

myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", apps.default.browser .. " -new-window /usr/share/doc/awesome/doc/index.html" },
   { "edit config", open_awesome_cfg},
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local SYSTEMCTL="systemctl -q --no-block"

session = {
    lock        = SYSTEMCTL .. " --user start lock.target",
    sleep       = SYSTEMCTL .. " suspend",
    logout      = SYSTEMCTL .. " --user exit",
    restart     = SYSTEMCTL .. " reboot",
    shutdown    = SYSTEMCTL .. " poweroff"
}

mysessionmenu = {}
for k, v in pairs(session) do
    table.insert(mysessionmenu, {k, v})
end

mysettingsmenu = {
    { "awesome", open_awesome_cfg },
    { "theme",  "lxappearance" },
    { "arandr", "arandr" }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "settings", mysettingsmenu },
                                    { "open terminal", apps.default.terminal },
                                    { "session", mysessionmenu }
                                  }
                        })

return {
    mainmenu = mymainmenu
}

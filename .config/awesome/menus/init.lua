

local awful = require("awful")
local beautiful = require("beautiful")
local freedesktop   = require("freedesktop")

local apps = require('cfg.apps')

local open_awesome_cfg = apps.default.editor_cmd .. " " .. awesome.conffile 

myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", apps.default.browser .. " -new-window /usr/share/doc/awesome/doc/index.html" },
   { "edit config", open_awesome_cfg},
   { "theme",  "lxappearance" },
   { "arandr", "arandr" },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = freedesktop.menu.build({ icon_size = beautiful.menu_height or 16,
                before = {
                    { "Awesome", myawesomemenu, beautiful.awesome_icon },
                    },
                after = {}
                })

return {
    mainmenu = mymainmenu
}

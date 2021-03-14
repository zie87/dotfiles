-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
local apps = require('cfg.apps')
awful.util.terminal = apps.default.terminal
local keys = require('cfg.keys')
local modkey = keys.mod.modKey

-- Themes define colours, icons, font and wallpapers.
local config_dir =  gears.filesystem.get_configuration_dir() 

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init(config_dir .. "themes/zie_arrow/theme.lua")
beautiful.wallpaper = config_dir .. "background/wallpaper_02.png"

-- {{{ Menu
-- Create a launcher widget and a main menu

mymainmenu = require('menus').mainmenu

local menu_icon = beautiful.awesome_icon 
mylauncher = awful.widget.launcher({ image = menu_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = apps.default.terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

local markup     = require("lain").util.markup
local separators = require("lain").util.separators
local widgets    = require("lain").widget

local icons_dir = config_dir .. "icons/"
-- clock widget
local myclock = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(beautiful.font, stdout))
    end
)
-- MEM
local memicon = wibox.widget.imagebox(icons_dir .. "mem.png")
local mem = widgets.mem({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. mem_now.used .. "MB "))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(icons_dir .. "cpu.png")
local cpu = widgets.cpu({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(icons_dir .. "temp.png")
local temp = widgets.temp({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. coretemp_now .. "°C "))
    end
})
-- volume widget
local volicon = wibox.widget.imagebox(icons_dir .. "vol.png")
local volume = widgets.alsa({
    settings = function()
        if volume_now.status == "off" then volicon:set_image(icons_dir .. "vol_mute.png")
        elseif tonumber(volume_now.level) == 0 then volicon:set_image(icons_dir .. "vol_no.png")
        elseif tonumber(volume_now.level) <= 50 then volicon:set_image(icons_dir .. "vol_low.png")
        else volicon:set_image(icons_dir .. "vol.png")
        end

        widget:set_markup(markup.font(beautiful.font, " " .. volume_now.level .. "% "))
    end
})

volume.widget:buttons(awful.util.table.join(
    awful.button({}, 4, function () awful.util.spawn("amixer -D pulse set Master 1%+") volume.update() end),
    awful.button({}, 5, function () awful.util.spawn("amixer -D pulse set Master 1%-") volume.update() end)
))
-- battery widget
local baticon = wibox.widget.imagebox(icons_dir .. "battery.png")
local bat = widgets.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then baticon:set_image(icons_dir .. "ac.png")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5  then baticon:set_image(icons_dir .. "battery_empty.png")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then baticon:set_image(icons_dir .. "battery_low.png" )
            else baticon:set_image(icons_dir .. "battery.png")
            end
            widget:set_markup(markup.font(beautiful.font, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.font(beautiful.font, " AC "))
            baticon:set_image(icons_dir .. "ac.png")
        end
    end
})
-- net widget
local neticon = wibox.widget.imagebox( config_dir .. "icons/net.png" )
local net = widgets.net({
    settings = function()
        widget:set_markup(markup.font(beautiful.font,
                          markup(beautiful.green, " " .. string.format("%06.1f", net_now.received))
                          .. " " ..
                          markup(beautiful.purple, " " .. string.format("%06.1f", net_now.sent) .. " ")))
    end
})

-- utils
local spacer  = wibox.widget.textbox(' ')
local arrow_dl = separators.arrow_left(beautiful.bg_focus, "alpha")
local arrow_ld = separators.arrow_left("alpha", beautiful.bg_focus)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ " ", " ", " ", " ", " ", " ", " ", " ", " "  }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
            spacer,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            spacer,
            arrow_ld,
            wibox.container.background(memicon, beautiful.bg_focus),
            wibox.container.background(mem.widget, beautiful.bg_focus),
            arrow_dl,
            wibox.container.background(cpuicon, beautiful.bg_normal),
            wibox.container.background(cpu.widget, beautiful.bg_normal),
            arrow_ld,
            wibox.container.background(tempicon, beautiful.bg_focus),
            wibox.container.background(temp.widget, beautiful.bg_focus),
            arrow_dl,
            wibox.container.background(baticon, beautiful.bg_normal),
            wibox.container.background(bat.widget, beautiful.bg_normal),
            arrow_ld,
            wibox.container.background(volicon, beautiful.bg_focus),
            wibox.container.background(volume.widget, beautiful.bg_focus),
            arrow_dl,
            wibox.container.background(neticon, beautiful.bg_normal),
            wibox.container.background(net.widget, beautiful.bg_normal),
            arrow_ld,
            wibox.container.background(myclock, beautiful.bg_focus),
            arrow_dl,
            spacer,
            wibox.container.background(s.mylayoutbox, beautiful.bg_normal),
        },
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}


globalkeys = keys.global
clientkeys = keys.client

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
            instance = {
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Wpa_gui",
                "Xephyr"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester",  -- xev.
            },
            role = {
            }
        }, properties = { floating = true }
    },

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }}, properties = { titlebars_enabled = true }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" }, properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- autorun programs

local autorun_apps = apps.run_on_start_up

for app = 1, #autorun_apps do
    awful.spawn.single_instance(autorun_apps[app])
end



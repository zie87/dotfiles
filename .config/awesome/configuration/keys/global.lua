local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')
-- Key bindings
local globalKeys = awful.util.table.join(
-- awesome
    awful.key({modkey}, "s", hotkeys_popup.show_help,       {description = "show help",group = "awesome"}),
    -- awful.key({modkey}, "w", function() mymainmenu:show() end, { description = "show main menu", group = "awesome" }),
    awful.key({modkey, "Control"}, "r", _G.awesome.restart, {description = "reload awesome", group = "awesome"}),
    awful.key({modkey}, "ö", function() awful.prompt.run {prompt = "Run Lua code: ", textbox = awful.screen.focused().mypromptbox.widget, exe_callback = awful.util.eval, history_path = awful.util.get_cache_dir() .. "/history_eval"} end, 
                                                            {description = "lua execute prompt", group = "awesome"}), 
    awful.key({modkey, "Shift"}, "q", _G.awesome.quit,      {description = "quit awesome", group = "awesome"}),
-- tags
    awful.key({modkey}, "Left", awful.tag.viewprev,          {description = "view previous", group = "tag"}),
    awful.key({modkey}, "Right", awful.tag.viewnext,         {description = "view next",     group = "tag"}), 
    awful.key({modkey}, "Escape", awful.tag.history.restore, {description = "go back",       group = "tag"}),
-- client
    awful.key({modkey}, "j", function() awful.client.focus.byidx(1)  end, {description = "focus next by index",     group = "client"}),
    awful.key({modkey}, "k", function() awful.client.focus.byidx(-1) end, {description = "focus previous by index", group = "client"}),

    awful.key({modkey, "Shift"}, "j", function() awful.client.swap.byidx(1)  end, {description = "swap with next client by index", group = "client"}),
    awful.key({modkey, "Shift"}, "k", function() awful.client.swap.byidx(-1) end, {description = "swap with previous client by index", group = "client"}),
    awful.key({modkey}, "u", awful.client.urgent.jumpto,                          {description = "jump to urgent client", group = "client"}),
    awful.key({modkey}, "Tab",  function() awful.client.focus.history.previous()
                                    if _G.client.focus then _G.client.focus:raise() end
                                end,                                              {description = "go back", group = "client"}),
-- screen
    awful.key({modkey, "Control"}, "j", function() awful.screen.focus_relative(1)  end, {description = "focus the next screen", group = "screen"}),
    awful.key({modkey, "Control"}, "k", function() awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"}),
-- layout
    awful.key({modkey}, "space",           function() awful.layout.inc(1) end,  {description = "select next", group = "layout"}),
    awful.key({modkey,  "Shift"}, "space", function() awful.layout.inc(-1) end, {description = "select previous", group = "layout"}),
    awful.key({modkey}, "l", function() awful.tag.incmwfact(0.05)  end,                   {description = "increase master width factor", group = "layout"}),
    awful.key({modkey}, "h", function() awful.tag.incmwfact(-0.05) end,                   {description = "decrease master width factor", group = "layout"}),
    awful.key({modkey, "Shift"}, "h", function() awful.tag.incnmaster(1, nil, true)  end, {description = "increase the number of master clients", group = "layout"}),
    awful.key({modkey, "Shift"}, "l", function() awful.tag.incnmaster(-1, nil, true) end, {description = "decrease the number of master clients", group = "layout"}),
    awful.key({modkey, "Control"}, "h", function() awful.tag.incncol(1, nil, true)   end, {description = "increase the number of columns", group = "layout"}),
    awful.key({modkey, "Control"}, "l", function() awful.tag.incncol(-1, nil, true)  end, {description = "decrease the number of columns", group = "layout"}),
-- launcher
    awful.key({modkey}, "Return",     function() awful.spawn(apps.default.terminal) end,    {description = "open a terminal",     Rgroup = "launcher"}),
    awful.key({modkey}, "b",          function() awful.spawn(apps.default.filemanager) end, {description = "launch filebrowser",  group = "launcher"}),
    awful.key({modkey, "Shift"}, "b", function() awful.spawn(apps.default.browser) end,     {description = "launch webbrowser",   group = "launcher"}),
    awful.key({modkey}, "e",          function() awful.spawn(apps.default.editor_cmd) end,  {description = "launch editor (cmd)", group = "launcher"}),
    awful.key({modkey, "Shift"}, "e", function() awful.spawn(apps.default.editor_gui) end,  {description = "launch editor (gui)", group = "launcher"}),
    awful.key({modkey}, "p",       function() awful.spawn(apps.default.rofi) end,           {description = "show the menubar", group = "launcher"}),
    awful.key({modkey, "Shift"}, "p", function() awful.spawn("rofi -modi drun -show drun -async-pre-load 100") end, {description = "show rofi", group = "launcher"}),
    -- awful.key({modkey}, "r",       function() awful.screen.focused().mypromptbox:run() end, {description = "run prompt", group = "launcher"}),
-- media keys
    awful.key({ }, "XF86MonBrightnessUp", function () awful.util.spawn("xbacklight -inc 10", false) end),
    awful.key({ }, "XF86MonBrightnessDown", function () awful.util.spawn("xbacklight -dec 10", false) end),
    awful.key({ }, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer set Master 9%+", false) end),
    awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn("amixer set Master 9%-", false) end),
    awful.key({ }, "XF86AudioMute", function () awful.util.spawn("amixer -q -D default sset Master toggle", false) end))


-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = 'view tag #', group = 'tag'}
        descr_toggle = {description = 'toggle tag #', group = 'tag'}
        descr_move = {
            description = 'move focused client to tag #',
            group = 'tag'
        }
        descr_toggle_focus = {
            description = 'toggle focused client on tag #',
            group = 'tag'
        }
    end
    globalKeys = awful.util.table.join(globalKeys, -- View tag only.
    awful.key({modkey}, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then tag:view_only() end
    end, descr_view), -- Toggle tag display.
    awful.key({modkey, 'Control'}, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then awful.tag.viewtoggle(tag) end
    end, descr_toggle), -- Move client to tag.
    awful.key({modkey, 'Shift'}, '#' .. i + 9, function()
        if _G.client.focus then
            local tag = _G.client.focus.screen.tags[i]
            if tag then _G.client.focus:move_to_tag(tag) end
        end
    end, descr_move), -- Toggle tag on focused client.
    awful.key({modkey, 'Control', 'Shift'}, '#' .. i + 9, function()
        if _G.client.focus then
            local tag = _G.client.focus.screen.tags[i]
            if tag then _G.client.focus:toggle_tag(tag) end
        end
    end, descr_toggle_focus))
end

return globalKeys

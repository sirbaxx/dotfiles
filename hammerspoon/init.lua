hyper = {"ctrl", "alt", "cmd", "shift"}

--[[
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)
--]]

--[[
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)
--]]


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
    else
        caffeine:setTitle("SLEEPY")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end




local wifiMenu = hs.menubar.new()
function ssidChangedCallback()
    SSID = hs.wifi.currentNetwork()
    if SSID == nil then
        SSID = "Disconnected"
    end
    wifiMenu:setTitle("" .. SSID .. "" )
end
wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
ssidChangedCallback()


function pingResult(object, message, seqnum, error)
    if message == "didFinish" then
        avg = tonumber(string.match(object:summary(), '/(%d+.%d+)/'))
        if avg == 0.0 then
            hs.alert.show("No network")
        elseif avg < 20.0 then
            hs.alert.show("Network perfect (" .. avg .. "ms)")
        elseif avg < 50.0 then
            hs.alert.show("Network good (" .. avg .. "ms)")
        elseif avg < 200.0 then
            hs.alert.show("Network okayish (" .. avg .. "ms)")
        elseif avg < 500.0 then
            hs.alert.show("Network poor(" .. avg .. "ms)")
        else
            hs.alert.show("Network bad(" .. avg .. "ms)")
        end
    end
end
hs.hotkey.bind(hyper, "p", function()hs.network.ping.ping("8.8.8.8", 1, 0.01, 1.0, "any", pingResult)end)


hs.execute("curl icanhazip.com")



--[[]
function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 3 seconds
    mouseCircleTimer = hs.timer.doAfter(3, function() mouseCircle:delete() end)
end
hs.hotkey.bind({"cmd","alt","shift"}, "D", mouseHighlight)
--]]


if hs.network.interfaceDetails(v4) then
    if hs.network.interfaceDetails(v4)["AirPort"] then
      print("on wifi")
    else
      print("on Lan")
    end
  else
    print("not connected to internet")
  end
  
  
  hs.urlevent.bind("someAlert", function(eventName, params)
      hs.alert.show("Received someAlert")
  end)
  
  
  -- Spotify search and play
  hs.loadSpoon("spotify-search-and-play")
  spoon['spotify-search-and-play']:setup({
    client_id = '1f4d63af4a5a41ee924fd1ef97e4f6de',
    secret = '8b050d07fdcb463a983c1fb20b2cbc81'
  })
  spoon['spotify-search-and-play']:bindHotkeys({
      show={ {"alt"}, "S"}}
  )
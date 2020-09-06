hs.loadSpoon("ShiftIt")
-- spoon.ShiftIt:bindHotkeys({})
spoon.ShiftIt:bindHotkeys({
  maximum = { {'alt' }, 'Down' },
  nextScreen = { {'alt'}, 'Up' },
  upleft = { { 'ctrl', 'alt', 'cmd' }, 'q' },
  upright = { { 'ctrl', 'alt', 'cmd' }, 'w' },
  botleft = { { 'ctrl', 'alt', 'cmd' }, 'e' },
  botright = { { 'ctrl', 'alt', 'cmd' }, 'r' },
});

function alacrittyFull()
  return function()
    local win = hs.window.focusedWindow()
    hs.window.focusedWindow():toggleFullScreen()
  end
end

hs.hotkey.bind({"alt"}, "space", function()
  local alacritty = hs.application.find('alacritty')
  if alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
    hs.hotkey.bind({"cmd"}, "j", alacrittyFull())
  end
end)

local hyper = {"shift", "alt", "cmd"}

hs.hotkey.bind(hyper, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 10
  win:setFrame(f)
end)

hs.hotkey.bind(hyper, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)

hs.hotkey.bind(hyper, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  win:setFrame(f)
end)

hs.hotkey.bind(hyper, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 10
  win:setFrame(f)
end)

local M = {}

local wezterm = require('wezterm')

local os_names = {
  win = 'x86_64-pc-windows-msvc',
  linux = 'x86_64-unknown-linux-gnu',
  mac = 'x86_64-pc-windows-msvc',
}

M.has = function(os) return wezterm.target_triple == os_names[os] end

-- Called during update_status event
local colorscheme_update = function(_, _)
  if tonumber(wezterm.time.now():format('%S')) ~= 0 then
    return
  end
  local new_sun_up = wezterm.time.now():sun_times(M.lat, M.long).up
  if new_sun_up ~= M.sun_up then
    M.sun_up = new_sun_up
    wezterm.reload_configuration()
  end
end

local theme_modes = {
  [0] = 'Suntime',
  [1] = 'Force Day',
  [2] = 'Force Night',
}

M.toggle_theme_mode = function(win)
  wezterm.GLOBAL.theme_mode = wezterm.GLOBAL.theme_mode + 1
  if wezterm.GLOBAL.theme_mode > 2 then
    wezterm.GLOBAL.theme_mode = 0
  end
  win:set_right_status(wezterm.format({
    { Text = 'Theme Mode: ' .. theme_modes[wezterm.GLOBAL.theme_mode] },
  }))
  wezterm.reload_configuration()
end

M.colorscheme_init = function(day_theme, night_theme, lat, long)
  if wezterm.GLOBAL.theme_mode == nil then
    wezterm.GLOBAL.theme_mode = 0
  end
  if wezterm.GLOBAL.theme_mode == 1 then
    wezterm.GLOBAL.colorscheme = day_theme
    return
  elseif wezterm.GLOBAL.theme_mode == 2 then
    wezterm.GLOBAL.colorscheme = night_theme
    return
  end

  M.sun_up = wezterm.time.now():sun_times(lat, long).up
  M.lat = lat
  M.long = long
  if M.sun_up then
    wezterm.GLOBAL.colorscheme = day_theme
  else
    wezterm.GLOBAL.colorscheme = night_theme
  end
  wezterm.on('update-status', colorscheme_update)
end

M.toggle_fetch_start = function(win)
  wezterm.GLOBAL.fetchstart = not wezterm.GLOBAL.fetchstart
  print('Set fetch start to ' .. tostring(wezterm.GLOBAL.fetchstart))
  win:set_right_status(wezterm.format({
    { Text = 'Fetch Start: ' .. tostring(wezterm.GLOBAL.fetchstart) },
  }))
  wezterm.reload_configuration()
end

return M

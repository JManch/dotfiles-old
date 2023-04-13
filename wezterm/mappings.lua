local M = {}

local wezterm = require('wezterm')
local act = wezterm.action

M.load = function(o, util)
  o.leader = { key = 'Space', mods = 'CTRL' }
  o.keys = {
    { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
    { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },
    { key = 'p', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },
    { key = 'n', mods = 'CTRL|SHIFT', action = act.SpawnWindow },
    { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },
    { key = '=', mods = 'CTRL|SHIFT', action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL|SHIFT', action = act.DecreaseFontSize },
    { key = 'Backspace', mods = 'CTRL|SHIFT', action = act.ResetFontSize },
    { key = 'n', mods = 'CTRL|SHIFT', action = act.SpawnTab('CurrentPaneDomain') },
    { key = 'w', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane({ confirm = false }) },
    { key = 'l', mods = 'CTRL|SHIFT', action = act.ShowDebugOverlay },
    { key = 'r', mods = 'CTRL|SHIFT', action = act.ReloadConfiguration },
    { key = 'f', mods = 'CTRL|SHIFT', action = act.TogglePaneZoomState },
    { key = 'v', mods = 'CTRL|SHIFT', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
    { key = 'x', mods = 'CTRL|SHIFT', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },
    { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Left') },
    { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Right') },
    { key = 'k', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Up') },
    { key = 'j', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Down') },
    { key = 'j', mods = 'ALT|CTRL', action = act.ActivateTabRelative(-1) },
    { key = 'k', mods = 'ALT|CTRL', action = act.ActivateTabRelative(1) },
    { key = 'o', mods = 'CTRL|SHIFT', action = act.OpenLinkAtMouseCursor },
    { key = 'y', mods = 'CTRL|SHIFT', action = act.ActivateCopyMode },
    { key = 's', mods = 'CTRL|SHIFT', action = act.QuickSelect },
    { key = '/', mods = 'CTRL|SHIFT', action = act.Search('CurrentSelectionOrEmptyString') },
    { key = 'o', mods = 'CTRL|SHIFT', action = act.ShowLauncher },
    {
      key = 'l',
      mods = 'LEADER',
      action = wezterm.action_callback(function(win, _) util.toggle_theme_mode(win) end),
    },
    {
      key = 'f',
      mods = 'LEADER',
      action = wezterm.action_callback(function(win, _) util.toggle_fetch_start(win) end),
    },
  }

  o.key_tables = {
    copy_mode = {
      { key = 'Escape', mods = '', action = act.CopyMode('Close') },
      { key = 'h', mods = '', action = act.CopyMode('MoveLeft') },
      { key = 'l', mods = '', action = act.CopyMode('MoveRight') },
      { key = 'k', mods = '', action = act.CopyMode('MoveUp') },
      { key = 'j', mods = '', action = act.CopyMode('MoveDown') },
      { key = 'w', mods = '', action = act.CopyMode('MoveForwardWord') },
      { key = 'b', mods = '', action = act.CopyMode('MoveBackwardWord') },
      {
        key = 'e',
        mods = '',
        action = act.Multiple({
          act.CopyMode('MoveRight'),
          act.CopyMode('MoveForwardWord'),
          act.CopyMode('MoveLeft'),
        }),
      },
      { key = '0', mods = '', action = act.CopyMode('MoveToStartOfLine') },
      { key = '\n', mods = '', action = act.CopyMode('MoveToStartOfNextLine') },
      { key = '$', mods = '', action = act.CopyMode('MoveToEndOfLineContent') },
      { key = '^', mods = '', action = act.CopyMode('MoveToStartOfLineContent') },
      { key = 'v', mods = '', action = act.CopyMode({ SetSelectionMode = 'Cell' }) },
      {
        key = 'v',
        mods = 'SHIFT',
        action = act.Multiple({
          act.CopyMode('MoveToStartOfLineContent'),
          act.CopyMode({ SetSelectionMode = 'Cell' }),
          act.CopyMode('MoveToEndOfLineContent'),
        }),
      },
      {
        key = 'y',
        mods = '',
        action = act({
          Multiple = {
            act.CopyTo('Clipboard'),
            act.CopyMode('Close'),
          },
        }),
      },
      {
        key = 'y',
        mods = 'SHIFT',
        action = act({
          Multiple = {
            act.CopyMode({ SetSelectionMode = 'Cell' }),
            act.CopyMode('MoveToEndOfLineContent'),
            act.CopyTo('Clipboard'),
            act.CopyMode('Close'),
          },
        }),
      },
      { key = 'g', mods = '', action = act.CopyMode('MoveToScrollbackTop') },
      { key = 'g', mods = 'SHIFT', action = act.CopyMode('MoveToScrollbackBottom') },
      { key = 'u', mods = '', action = act.CopyMode('PageUp') },
      { key = 'd', mods = '', action = act.CopyMode('PageDown') },
      { key = '/', mods = '', action = act.Search('CurrentSelectionOrEmptyString') },
      {
        key = 'n',
        mods = '',
        action = act.Multiple({
          act.CopyMode('NextMatch'),
          act.CopyMode('ClearSelectionMode'),
        }),
      },
      {
        key = 'n',
        mods = 'SHIFT',
        action = act.Multiple({
          act.CopyMode('PriorMatch'),
          act.CopyMode('ClearSelectionMode'),
        }),
      },
    },
    search_mode = {
      { key = 'Escape', mods = '', action = act.CopyMode('Close') },
      {
        key = 'Enter',
        mods = '',
        action = act.Multiple({
          act.CopyMode('ClearSelectionMode'),
          act.ActivateCopyMode,
        }),
      },
      { key = 'n', mods = 'ALT|SHIFT|CTRL', action = act.CopyMode('PriorMatch') },
      { key = 'n', mods = 'ALT|SHIFT', action = act.CopyMode('NextMatch') },
      { key = '/', mods = '', action = act.CopyMode('ClearPattern') },
    },
  }

  o.mouse_bindings = {
    {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = '',
      action = act.ScrollByCurrentEventWheelDelta,
    },
    {
      event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = '',
      action = act.ScrollByCurrentEventWheelDelta,
    },
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = 'OpenLinkAtMouseCursor',
    },
  }

  for i = 1, 9 do
    table.insert(o.keys, {
      key = tostring(i),
      mods = 'ALT',
      action = act.ActivateTab(i - 1),
    })
  end
end

return M

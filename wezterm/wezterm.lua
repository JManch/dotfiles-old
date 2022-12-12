local wezterm = require("wezterm")
local util = require("util")

local o = {}

-- General
if wezterm.GLOBAL.fetchstart == nil then
    wezterm.GLOBAL.fetchstart = true
end
if util.has("win") then
    if wezterm.GLOBAL.fetchstart then
        o.default_prog = { "C:\\Users\\Joshua\\scoop\\shims\\pwsh.exe", "-nologo", "-noexit", "-command", "winfetch" }
    else
        o.default_prog = { "C:\\Users\\Joshua\\scoop\\shims\\pwsh.exe", "-nologo" }
    end
end
local wsl_domains = wezterm.default_wsl_domains()
local primary_wsl_domain = nil
for _, domain in ipairs(wsl_domains) do
    if primary_wsl_domain == nil then
        primary_wsl_domain = domain
    end
    domain.default_cwd = "~"
    if wezterm.GLOBAL.fetchstart then
        domain.default_prog = { "zsh", "-c", "neofetch && zsh -l" }
    end
end
o.wsl_domains = wsl_domains

-- Visual
o.font_size = 14
o.font = wezterm.font("FiraCode NF")
o.custom_block_glyphs = false
-- o.window_decorations = "NONE"
o.initial_rows = 21
o.initial_cols = 98
o.launch_menu = {
    {
        label = "Neovim",
        args = { "nvim" },
    },
}
if util.has("win") then
    table.insert(o.launch_menu, {
        label = "Neovim WSL",
        domain = { DomainName = primary_wsl_domain.name },
        cwd = "~",
        args = { "zsh", "-l", "-c", "nvim" },
    })
end
o.inactive_pane_hsb = {
    saturation = 1,
    brightness = 1,
}
o.adjust_window_size_when_changing_font_size = false
o.hide_tab_bar_if_only_one_tab = true

-- Performance
if util.has("win") then
    o.max_fps = 165
end
o.status_update_interval = 1000

-- Sunset/sunrise colorscheme
util.colorscheme_init("AyuLight (Gogh)", "AyuMirage (Gogh)", 50.8229, -0.1363)
o.color_scheme = wezterm.GLOBAL.colorscheme

-- Mappings
o.disable_default_key_bindings = true
o.disable_default_mouse_bindings = true
o.use_dead_keys = false
require("mappings").load(o, util)

return o

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.timeoutlen = 500
vim.g.trouble_lualine = false
vim.opt_local.expandtab = true
vim.g.working = false

local function terminalCMD(cmd)
  local resp = io.popen(cmd)
  if resp == nil then
    return
  end

  local output = resp:read("*a")
  resp:close()
  return tostring(output)
end

vim.g.autoformat = not vim.g.working


if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font Mono"
  vim.g.neovide_padding_top = 4
  vim.g.neovide_scale_factor = 0.75
  vim.g.neovide_opacity = 0.6
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_floating_corner_radius = 0.5
  vim.g.neovide_scroll_animation_far_lines = 30
end

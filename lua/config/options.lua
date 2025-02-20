-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.timeoutlen = 500
vim.g.trouble_lualine = false
vim.g.mousemodel = "extend"
vim.g.working = false

vim.g.autoformat = not vim.g.working

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font Mono"
  vim.g.neovide_scale_factor = 0.8
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_floating_corner_radius = 0.5
  vim.g.neovide_scroll_animation_far_lines = 10
end

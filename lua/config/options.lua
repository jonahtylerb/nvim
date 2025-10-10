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

vim.g.working = terminalCMD("git remote get-url origin"):match("gitlab") ~= nil

local copilotAccount = terminalCMD("gh auth status | grep -B1 'Active account: true' | head -1 | awk '{print $7}'")

if copilotAccount then
  if vim.g.working then
    if copilotAccount:match("jonahtylerb") then
      os.execute("gh auth switch")
    end
  else
    if not copilotAccount:match("jonahtylerb") then
      os.execute("gh auth switch")
    end
  end
end

vim.g.autoformat = not vim.g.working

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font Mono"
  vim.g.neovide_padding_top = 4
  vim.g.neovide_scale_factor = 0.75
  vim.g.neovide_opacity = 0.6
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_corner_radius = 0.5
  vim.g.neovide_scroll_animation_far_lines = 30
end

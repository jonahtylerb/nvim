-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("n", "<leader>p", "m`o<ESC>p``", { desc = "Paste below current line" })
keymap.set("n", "<leader>P", "m`O<ESC>p``", { desc = "Paste above current line" })

keymap.set("n", "<leader>a", "m`a <ESC>``", { desc = "Add a space to the left" })
keymap.set("n", "<leader>i", "m`i <ESC>``", { desc = "Add a space to the right" })

keymap.set("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {
  expr = true,
  desc = "Insert line below",
})
keymap.set("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {
  expr = true,
  desc = "Insert line above",
})

keymap.set("x", "p", '"_c<Esc>p')

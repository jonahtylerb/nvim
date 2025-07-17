-- Plugins enabled when I'm working
if vim.g.working then
  return {
    { import = "lazyvim.plugins.extras.linting.eslint" },
    -- { import = "lazyvim.plugins.extras.ai.copilot" },
    { import = "lazyvim.plugins.extras.ai.copilot-chat" },
    { import = "lazyvim.plugins.extras.ai.codeium" },
  }
end

-- Plugins disabled when I'm working
if not vim.g.working then
  return {
    { import = "lazyvim.plugins.extras.ai.codeium" },
    -- {
    --   "monkoose/neocodeium",
    --   cmd = "NeoCodeium",
    --   opts = {
    --     filetypes = {
    --       noice = false,
    --     },
    --     silent = true,
    --     show_label = true,
    --   },
    --   keys = {
    --     {
    --       "<C-CR>",
    --       function()
    --         require("neocodeium").accept()
    --       end,
    --       mode = "i",
    --       desc = "󰚩 Accept full suggestion",
    --     },
    --     {
    --       "<C-i>",
    --       function()
    --         require("neocodeium").accept_line()
    --       end,
    --       mode = "i",
    --       desc = "󰚩 Accept line",
    --     },
    --     {
    --       "<C-x>",
    --       function()
    --         require("neocodeium").clear()
    --       end,
    --       mode = "i",
    --       desc = "󰚩 Clear suggestion",
    --     },
    --     {
    --       "<C-o>",
    --       function()
    --         require("neocodeium").accept_word()
    --       end,
    --       mode = "i",
    --       desc = "󰚩 Accept word",
    --     },
    --     {
    --       "<leader>ci",
    --       function()
    --         vim.cmd.NeoCodeium("toggle")
    --       end,
    --       desc = "󰚩 NeoCodeium Suggestions",
    --     },
    --   },
    -- },
  }
end

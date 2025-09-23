-- Plugins enabled when I'm working
if vim.g.working then
  return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          eslint = {
            settings = {
              workingDirectories = { mode = "auto" },
              format = false,
            },
          },
        },
      },
    },
    { import = "lazyvim.plugins.extras.ai.copilot-chat" },
    { import = "lazyvim.plugins.extras.ai.codeium" },
  }
end

-- Plugins disabled when I'm working
if not vim.g.working then
  return {
    { import = "lazyvim.plugins.extras.ai.codeium" },
  }
end

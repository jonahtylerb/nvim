-- Plugins enabled when I'm working
if vim.g.working then
  return {
    { import = "lazyvim.plugins.extras.ai.copilot-native" },
    { import = "lazyvim.plugins.extras.ai.sidekick" },
    -- { import = "lazyvim.plugins.extras.ai.codeium" },
  }
else
  return {
    { import = "lazyvim.plugins.extras.ai.codeium" },
  }
end

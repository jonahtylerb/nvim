-- Plugins enabled when I'm working
if vim.g.working then
  return {
    { import = "lazyvim.plugins.extras.linting.eslint" },
  }
else
  return {
    { import = "lazyvim.plugins.extras.formatting.prettier" },
  }
end

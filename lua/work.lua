-- Plugins enabled when I'm working
if vim.g.working then
  return {
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.ai.codeium" },
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = { eslint = {} },
        setup = {
          eslint = function()
            require("lazyvim.util").lsp.on_attach(function(client)
              if client.name == "eslint" then
                client.server_capabilities.documentFormattingProvider = true
              else
                client.server_capabilities.documentFormattingProvider = false
              end
            end)
          end,
        },
      },
    },
  }
else
  return {
    { import = "lazyvim.plugins.extras.ai.codeium" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
  }
end

return {
  {
    "jonahtylerb/lux",
    lazy = false,
    priority = 1000,
    config = function()
      local transparent = { bg = "None" }

      if vim.g.neovide then
        transparent = {}
      end
      require("lux").setup({
        terminal = true,
        overrides = {
          Normal = transparent,
          NormalFloat = transparent,
          ColorColumn = transparent,
          SignColumn = transparent,
          Folded = transparent,
          FoldColumn = transparent,
          CursorLine = transparent,
          CursorColumn = transparent,
          VertSplit = transparent,
          NonText = { fg = "#003355" },
        },
      })
    end,
  },
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      local transparent = { bg = "None" }

      if vim.g.neovide then
        transparent = {}
      end
      require("ayu").setup({
        terminal = true,
        overrides = {
          Normal = transparent,
          NormalFloat = transparent,
          ColorColumn = transparent,
          SignColumn = transparent,
          Folded = transparent,
          FoldColumn = transparent,
          CursorLine = transparent,
          CursorColumn = transparent,
          VertSplit = transparent,
          NonText = { fg = "#003355" },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lux",
    },
  },
}

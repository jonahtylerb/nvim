return {
  { "akinsho/git-conflict.nvim", version = "*", config = true, event = "VeryLazy" },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        component_separators = "",
        section_separators = { left = " 󰄛", right = "" },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      highlights = {
        buffer_selected = {
          link = "Label",
          bold = true,
          italic = false,
        },
      },
      options = {
        separator_style = vim.g.neovide and "slant",
      },
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewLog",
      "DiffviewRefresh",
    },
    config = true,
  },

  {
    "tenxsoydev/karen-yank.nvim",
    vscode = true,
    keys = { "y" },
    config = true,
  },

  {
    "nullromo/go-up.nvim",
    config = true,
    event = "LazyFile",
  },

  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    config = true,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = { timeout_ms = 10000 },
    },
  },

  {
    "axelvc/template-string.nvim",
    vscode = true,
    event = "InsertEnter",
    opts = {
      filetypes = {
        "html",
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
        "python",
        "astro",
        "vue",
        "svelte",
      },
      jsx_brackets = true,
      remove_template_string = true,
    },
  },

  {
    "lewis6991/satellite.nvim",
    event = "LazyFile",
    opts = {
      current_only = true,
      winblend = 100,
      excluded_filetypes = { "snacks_picker_list", "terminal" },
      width = 1,
    },
  },

  {
    "codethread/qmk.nvim",
    event = "BufEnter keymap.c",
    opts = {
      name = "LAYOUT_planck_mit",
      layout = {
        "x x x x x x x x x x x x",
        "x x x x x x x x x x x x",
        "x x x x x x x x x x x x",
        "x x x x x x^x x x x x x",
      },
    },
  },

  {
    "Eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader><cr>", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it Rain" },
    },
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    vscode = true,
    event = "VeryLazy",
    opts = function()
      vim.keymap.set("n", "dsi", function()
        -- select outer indentation
        require("various-textobjs").indentation("outer", "outer")

        -- plugin only switches to visual mode when a textobj has been found
        local indentationFound = vim.fn.mode():find("V")
        if not indentationFound then
          return
        end

        -- dedent indentation
        vim.cmd.normal({ "<", bang = true })

        -- delete surrounding lines
        local endBorderLn = vim.api.nvim_buf_get_mark(0, ">")[1]
        local startBorderLn = vim.api.nvim_buf_get_mark(0, "<")[1]
        vim.cmd(tostring(endBorderLn) .. " delete") -- delete end first so line index is not shifted
        vim.cmd(tostring(startBorderLn) .. " delete")
      end, { desc = "Delete Surrounding Indentation" })

      return {
        keymaps = {
          useDefaults = true,
        },
      }
    end,
  },

  {
    "S1M0N38/love2d.nvim",
    cmd = "LoveRun",
    opts = {
      restart_on_save = false,
      path_to_love_bin = "~/Downloads/love-11.5-x86_64.AppImage",
      debug_window_opts = {
        split = "below",
      },
    },
    keys = {
      { "<leader>v", ft = "lua", desc = "LÖVE" },
      { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
      { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
    },
  },

  {
    "Wansmer/treesj",
    vscode = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>m", desc = "Toggle split" },
      { "<leader>M", desc = "Toggle split recursive" },
    },
    opts = function()
      vim.keymap.set("n", "<leader>m", require("treesj").toggle, { desc = "Toggle split" })
      vim.keymap.set("n", "<leader>M", function()
        require("treesj").toggle({ split = { recursive = true } })
      end, { desc = "Toggle split recursive" })

      return {
        use_default_keymaps = false,
        max_join_length = 1000,
      }
    end,
  },

  {
    "gbprod/substitute.nvim",
    vscode = true,
    config = true,
    keys = {
      { ";", "<cmd>lua require('substitute').operator()<cr>", desc = "Replace" },
      { ";;", "<cmd>lua require('substitute').line()<cr>", desc = "Replace Line" },
      { ";l", "<cmd>lua require('substitute').eol()<cr>", desc = "Replace EOL" },
      { ";", "<cmd>lua require('substitute').visual()<cr>", desc = "Replace", mode = { "x" } },
    },
  },

  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
      { "<leader>su", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },

  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add cursor above/below the main cursor.
      set({ "n", "x" }, "<leader><up>", function()
        mc.lineAddCursor(-1)
      end, { desc = "Add cursor above" })
      set({ "n", "x" }, "<leader><down>", function()
        mc.lineAddCursor(1)
      end, { desc = "Add cursor below" })

      -- Add a new cursor by matching word/selection
      set({ "n", "x" }, "<leader>z", function()
        mc.matchAddCursor(1)
      end, { desc = "Add cursor to word" })
      set({ "n", "x" }, "<leader>Z", function()
        mc.matchAddCursor(-1)
      end, { desc = "Add cursor to word before" })

      -- Add and remove cursors with control + left click.
      set("n", "<c-leftmouse>", mc.handleMouse)
      set("n", "<c-leftdrag>", mc.handleMouseDrag)
      set("n", "<c-leftrelease>", mc.handleMouseRelease)

      -- Disable and enable cursors.
      set({ "n", "x" }, "<c-z>", mc.toggleCursor, { desc = "Disable multicursors" })
    end,
    keys = {
      "<leader><up>",
      "<leader><down>",
      "<leader>z",
      "<leader>Z",
      "<c-leftmouse>",
      "<c-leftdrag>",
      "<c-leftrelease>",
      "<c-z>",
    },
  },

  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = "                                                 _.oo.          \n                         _.u[[/;:,.         .odMMMMMM'          \n                      .o888UU[[[/;:-.  .o@P^    MMM^            \n                     oN88888UU[[[/;::-.        dP^              \n███╗   ██╗███████╗  dNMMNN888UU[[[/;:--. ██╗.@P██╗██╗███╗   ███╗\n████╗  ██║██╔════╝ ,MMMMMMN888UU[[/;::-. ██║   ██║██║████╗ ████║\n██╔██╗ ██║█████╗   NNMMMNN888UU[[[/~.o@P^██║   ██║██║██╔████╔██║\n██║╚██╗██║██╔══╝   888888888UU[[[/o@^-.. ╚██╗ ██╔╝██║██║╚██╔╝██║\n██║ ╚████║███████╗oI8888UU[[[/o@P^:--..   ╚████╔╝ ██║██║ ╚═╝ ██║\n╚═╝  ╚═══╝╚══════╝  YUU[[[/o@^;::---..     ╚═══╝  ╚═╝╚═╝     ╚═╝\n             oMP     ^/o@P^;:::---..                            \n          .dMMM    .o@^ ^;::---...                              \n         dMMMMMMM@^`       `^^^^                                \n        YMMMUP^                                                 \n         ^^                                                     ",
        },
        sections = {
          { section = "header", height = 8 },
          { section = "keys" },
          { section = "startup", padding = 2 },
        },
      },
      scroll = { enabled = not vim.g.neovide },
      picker = {
        sources = {
          files = { hidden = true },
          explorer = { hidden = true },
        },
      },
    },
  },

  {
    "Darazaki/indent-o-matic",
    event = "LazyFile",
    opts = {
      max_lines = 1024,
      standard_widths = { 2, 3, 4, 8 },
    },
  },

  {
    "m4xshen/smartcolumn.nvim",
    event = "LazyFile",
    opts = {
      colorcolumn = { "90", "140" },
    },
  },

  {
    "bennypowers/nvim-regexplainer",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<space>R", "<cmd>RegexplainerToggle<cr>", desc = "Toggle regexplainer" },
    },
  },
}

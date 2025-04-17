return {
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        documentation = { window = { border = "single" } },
      },
    },
  },

  { "akinsho/git-conflict.nvim", version = "*", config = true, event = "VeryLazy" },

  {
    "tenxsoydev/karen-yank.nvim",
    vscode = true,
    event = "VeryLazy",
    config = true,
  },

  {
    "nullromo/go-up.nvim",
    config = true,
    event = "VeryLazy",
  },

  {
    "stevearc/oil.nvim",
    vscode = true,
    cmd = "Oil",
    config = true,
  },

  {
    "xiyaowong/nvim-transparent",
    cmd = { "TransparentDisable", "TransparentEnable", "TransparentToggle" },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = { timeout_ms = 10000 },
    },
  },

  {
    "max397574/better-escape.nvim",
    enabled = not vim.g.desktop,
    event = "VeryLazy",
    opts = {
      default_mappings = false,
      mappings = {
        i = { j = { k = "<Esc>" } },
        c = { j = { k = "<Esc>" } },
        t = { j = { k = "<Esc>" } },
        v = { j = { k = "<Esc>" } },
        s = { j = { k = "<Esc>" } },
      },
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
    event = "VeryLazy",
    opts = {
      current_only = true,
      winblend = 100,
      excluded_filetypes = { "snacks_picker_list", "terminal" },
      width = 1,
    },
  },

  {
    "codethread/qmk.nvim",
    event = "VeryLazy",
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
    lazy = false,
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
    vscode = true,
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
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "stevearc/dressing.nvim" },
    },
    cmd = "CodeCompanionChat",
    opts = {
      adapters = {
        llama3 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "llama3",
            schema = {
              model = {
                default = "llama3.2",
              },
            },
          })
        end,
      },
      strategies = {
        chat = { adapter = "llama3" },
        inline = { adapter = "llama3" },
        agent = { adapter = "llama3" },
      },
    },
  },

  {
    "echasnovski/mini.splitjoin",
    vscode = true,
    config = true,
    keys = {
      { "gS", desc = "Toggle split/join" },
    },
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
    event = "VeryLazy",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      set({ "n", "x" }, "<up>", function()
        mc.lineAddCursor(-1)
      end)
      set({ "n", "x" }, "<down>", function()
        mc.lineAddCursor(1)
      end)
      set({ "n", "x" }, "<leader><up>", function()
        mc.lineSkipCursor(-1)
      end)
      set({ "n", "x" }, "<leader><down>", function()
        mc.lineSkipCursor(1)
      end)

      -- Add or skip adding a new cursor by matching word/selection
      set({ "n", "x" }, "<leader>z", function()
        mc.matchAddCursor(1)
      end)
      set({ "n", "x" }, "<leader>Z", function()
        mc.matchAddCursor(-1)
      end)

      -- Add and remove cursors with control + left click.
      set("n", "<c-leftmouse>", mc.handleMouse)
      set("n", "<c-leftdrag>", mc.handleMouseDrag)
      set("n", "<c-leftrelease>", mc.handleMouseRelease)

      -- Disable and enable cursors.
      set({ "n", "x" }, "<c-z>", mc.toggleCursor)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)

        -- Delete the main cursor.
        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { link = "Cursor" })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },

  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = "                                                 _.oo.          \n                         _.u[[/;:,.         .odMMMMMM'          \n                      .o888UU[[[/;:-.  .o@P^    MMM^            \n                     oN88888UU[[[/;::-.        dP^              \n███╗   ██╗███████╗  dNMMNN888UU[[[/;:--. ██╗.@P██╗██╗███╗   ███╗\n████╗  ██║██╔════╝ ,MMMMMMN888UU[[/;::-. ██║   ██║██║████╗ ████║\n██╔██╗ ██║█████╗   NNMMMNN888UU[[[/~.o@P^██║   ██║██║██╔████╔██║\n██║╚██╗██║██╔══╝   888888888UU[[[/o@^-.. ╚██╗ ██╔╝██║██║╚██╔╝██║\n██║ ╚████║███████╗oI8888UU[[[/o@P^:--..   ╚████╔╝ ██║██║ ╚═╝ ██║\n╚═╝  ╚═══╝╚══════╝  YUU[[[/o@^;::---..     ╚═══╝  ╚═╝╚═╝     ╚═╝\n             oMP     ^/o@P^;:::---..                            \n          .dMMM    .o@^ ^;::---...                              \n         dMMMMMMM@^`       `^^^^                                \n        YMMMUP^                                                 \n         ^^                                                     ",
        },
        sections = {
          { section = "header", height = 10 },
          { section = "keys", padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup", padding = 2 },
        },
      },
      scroll = { enabled = not vim.g.neovide },
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
}

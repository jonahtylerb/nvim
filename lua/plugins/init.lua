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
          bold = true,
          italic = false,
        },
      },
      options = {
        separator_style = "thin",
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
    event = "LazyFile",
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
    ---@module 'snacks.nvim'
    ---@type snacks.Config
    opts = {
      dashboard = {
        preset = {
          header = "                                                 _.oo.          \n                         _.u[[/;:,.         .odMMMMMM'          \n                      .o888UU[[[/;:-.  .o@P^    MMM^            \n                     oN88888UU[[[/;::-.        dP^              \n███╗   ██╗███████╗  dNMMNN888UU[[[/;:--. ██╗.@P██╗██╗███╗   ███╗\n████╗  ██║██╔════╝ ,MMMMMMN888UU[[/;::-. ██║   ██║██║████╗ ████║\n██╔██╗ ██║█████╗   NNMMMNN888UU[[[/~.o@P^██║   ██║██║██╔████╔██║\n██║╚██╗██║██╔══╝   888888888UU[[[/o@^-.. ╚██╗ ██╔╝██║██║╚██╔╝██║\n██║ ╚████║███████╗oI8888UU[[[/o@P^:--..   ╚████╔╝ ██║██║ ╚═╝ ██║\n╚═╝  ╚═══╝╚══════╝  YUU[[[/o@^;::---..     ╚═══╝  ╚═╝╚═╝     ╚═╝\n             oMP     ^/o@P^;:::---..                            \n          .dMMM    .o@^ ^;::---...                              \n         dMMMMMMM@^`       `^^^^                                \n        YMMMUP^                                                 \n         ^^                                                     ",
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            {
              icon = " ",
              key = "g",
              desc = "Lazygit",
              action = function()
                Snacks.lazygit({ cwd = LazyVim.root.git() })
              end,
            },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header", height = 8 },
          { section = "keys", padding = 1 },
          function()
            if not vim.g.working then
              return {}
            end

            local mr_output = vim.fn.system("glab mr list --assignee=@me -F json")
            if vim.v.shell_error ~= 0 or mr_output == "" then
              return {}
            end

            local ok, mrs = pcall(vim.json.decode, mr_output)
            if not ok or type(mrs) ~= "table" or #mrs == 0 then
              return {}
            end

            local items = {}

            for i = 1, math.min(5, #mrs) do
              local mr = mrs[i]
              local title = mr.title

              if #title > 50 then
                title = title:sub(1, 50) .. ".."
              end

              local username = mr.author.username:sub(1, 2):upper()

              table.insert(items, {
                text = {
                  { username, hl = "Identifier", width = 2, align = "right" },
                  { " " .. title, hl = "Normal", width = 53 },
                  { tostring(i), hl = "Special", width = 2, align = "right" },
                },
                action = function()
                  vim.fn.system("glab mr view " .. mr.iid .. " --web")
                  vim.fn.system("git checkout " .. mr.source_branch)
                  Snacks.lazygit({ cwd = LazyVim.root.git() })
                end,
                key = tostring(i),
              })
            end

            return {
              icon = " ",
              title = "My Merge Requests",
              indent = 3,
              padding = 1,
              key = "m",
              action = function()
                vim.fn.system("glab repo view --web")
              end,
              items,
            }
          end,
          { pane = 1, icon = " ", title = "Projects", section = "projects", indent = 3, padding = 1 },
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
      bigfile = {
        enabled = false,
      },
    },
  },

  {
    "folke/persistence.nvim",
    enabled = false,
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

  {
    "monkoose/neocodeium",
    event = "InsertEnter",
    opts = function()
      local neocodeium = require("neocodeium")

      vim.keymap.set("i", "<Tab>", function()
        neocodeium.accept()
      end, { expr = true })

      vim.keymap.set("i", "<c-i>", function()
        neocodeium.accept_word()
      end)
      vim.keymap.set("i", "<c-o>", function()
        neocodeium.accept_line()
      end)
      vim.keymap.set("i", "<A-]>", function()
        neocodeium.cycle()
      end)
      vim.keymap.set("i", "<A-[>", function()
        neocodeium.cycle(-1)
      end)
      vim.keymap.set("i", "<A-c>", function()
        neocodeium.clear()
      end)

      return {
        single_line = {
          enabled = true,
          label = "",
        },
      }
    end,
    keys = {
      { "<Tab>", mode = "i", desc = "Windsurf accept" },
      { "<c-i>", mode = "i", desc = "Windsurf accept word" },
      { "<c-o>", mode = "i", desc = "Windsurf accept line" },
      { "<A-]>", mode = "i", desc = "Windsurf cycle next" },
      { "<A-[>", mode = "i", desc = "Windsurf cycle previous" },
      { "<A-c>", mode = "i", desc = "Windsurf clear" },
    },
  },

  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
      keymap = {
        ["<Tab>"] = {},
        ["<S-Tab>"] = {},
      },
    },
  },

  {
    "olimorris/persisted.nvim",
    event = "BufReadPre",
    opts = {
      use_git_branch = true,
    },
    keys = {
      { "<leader>qs", "<cmd>SessionLoad<cr>", desc = "Restore Session" },
      { "<leader>qS", "<cmd>SessionSelect<cr>", desc = "Select Session" },
      { "<leader>ql", "<cmd>SessionLoadLast<cr>", desc = "Restore Last Session" },
      { "<leader>qd", "<cmd>SessionDelete<cr>", desc = "Delete the Current Session" },
    },
  },
}

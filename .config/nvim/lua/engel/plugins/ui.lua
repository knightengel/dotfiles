return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local colors = {
        bg = "#04131f",
        fg = "#d8f4ff",
        blue = "#5cc8ff",
        cyan = "#9fe7f7",
        green = "#79cbbd",
        yellow = "#d9cb93",
        red = "#d98aa0",
        purple = "#b4c5f3",
        dark = "#071d2f",
      }

      require("lualine").setup({
        options = {
          theme = {
            normal = {
              a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
              b = { bg = colors.dark, fg = colors.fg },
              c = { bg = "NONE", fg = colors.fg },
            },
            insert = {
              a = { bg = colors.green, fg = colors.bg, gui = "bold" },
            },
            visual = {
              a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
            },
            replace = {
              a = { bg = colors.red, fg = colors.bg, gui = "bold" },
            },
            command = {
              a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
            },
            inactive = {
              a = { bg = "NONE", fg = colors.fg },
              b = { bg = "NONE", fg = colors.fg },
              c = { bg = "NONE", fg = colors.fg },
            },
          },
          component_separators = "",
          section_separators = "",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = {
            {
              "filename",
              path = 1,
              symbols = {
                modified = " +",
                readonly = " ro",
                unnamed = "no name",
              },
            },
          },
          lualine_x = { "diagnostics", "encoding", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("notify").setup({
        background_colour = "#04131f",
        fps = 60,
        render = "compact",
        stages = "fade",
        timeout = 1800,
      })

      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        views = {
          cmdline_popup = {
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            filter_options = {},
            win_options = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
        },
      })
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        preset = "modern",
        delay = 250,
        icons = {
          mappings = false,
          keys = {},
        },
        win = {
          border = "rounded",
        },
      })
    end,
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        " ",
        "    ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
        "    ████╗  ██║██║   ██║██║████╗ ████║",
        "    ██╔██╗ ██║██║   ██║██║██╔████╔██║",
        "    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
        " ",
        "            ice glass editor",
        " ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "find file", "<cmd>Telescope find_files<cr>"),
        dashboard.button("r", "recent files", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("g", "grep text", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("c", "config", "<cmd>e ~/.config/nvim/init.lua<cr>"),
        dashboard.button("l", "lazy", "<cmd>Lazy<cr>"),
        dashboard.button("q", "quit", "<cmd>qa<cr>"),
      }

      dashboard.section.footer.val = "Ghostty + Neovim + Ice Mountain"
      dashboard.section.header.opts.hl = "Type"
      dashboard.section.buttons.opts.hl = "Keyword"
      dashboard.section.footer.opts.hl = "Comment"

      alpha.setup(dashboard.opts)
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
        },
        scope = {
          enabled = true,
          char = "│",
          show_start = false,
          show_end = false,
        },
      })
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        delay = 160,
        large_file_cutoff = 2000,
      })
    end,
  },
}

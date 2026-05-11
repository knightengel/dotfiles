return {
  {
    "echasnovski/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.pairs").setup()
      require("mini.move").setup({
        mappings = {
          left = "<M-h>",
          right = "<M-l>",
          down = "<M-j>",
          up = "<M-k>",
          line_left = "<M-h>",
          line_right = "<M-l>",
          line_down = "<M-j>",
          line_up = "<M-k>",
        },
      })
      require("mini.trailspace").setup()
      require("mini.cursorword").setup()
      require("mini.bracketed").setup()
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous TODO" },
    },
    opts = {
      signs = true,
      keywords = {
        FIX = { icon = "FIX", color = "error", alt = { "FIXME", "BUG" } },
        TODO = { icon = "TODO", color = "info" },
        HACK = { icon = "HACK", color = "warning" },
        WARN = { icon = "WARN", color = "warning", alt = { "WARNING" } },
        PERF = { icon = "PERF", color = "hint" },
        NOTE = { icon = "NOTE", color = "hint", alt = { "INFO" } },
      },
    },
  },
}

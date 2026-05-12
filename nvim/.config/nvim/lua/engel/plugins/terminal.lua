return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Vertical terminal" },
    },
    opts = {
      size = 14,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = false,
      direction = "float",
      float_opts = {
        border = "rounded",
        width = function()
          return math.floor(vim.o.columns * 0.82)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.72)
        end,
      },
    },
  },
}

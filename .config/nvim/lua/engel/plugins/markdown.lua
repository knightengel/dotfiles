return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "Avante" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      heading = {
        enabled = true,
        sign = false,
      },
      code = {
        sign = false,
        width = "block",
        right_pad = 2,
      },
      dash = {
        enabled = true,
      },
    },
  },
}

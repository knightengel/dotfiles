return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.12,
        },
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = { "bold" },
          keywords = { "italic" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = { "bold" },
          properties = {},
          types = { "bold" },
        },
        color_overrides = {
          mocha = {
            base = "#04131f",
            mantle = "#03101a",
            crust = "#020a11",
            text = "#d8f4ff",
            subtext1 = "#bdeeff",
            subtext0 = "#8fb6c9",
            overlay2 = "#6f9fb8",
            overlay1 = "#4f7890",
            overlay0 = "#385a70",
            surface2 = "#154861",
            surface1 = "#12384f",
            surface0 = "#071d2f",
            blue = "#5cc8ff",
            sky = "#9fe7f7",
            sapphire = "#2c92c8",
            teal = "#79cbbd",
            green = "#8bd5ca",
            yellow = "#d9cb93",
            peach = "#d99a7a",
            maroon = "#d98aa0",
            red = "#d98aa0",
            mauve = "#b4c5f3",
            pink = "#e7a0c4",
            lavender = "#b4c5f3",
          },
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          which_key = true,
          mason = true,
          notify = true,
          mini = true,
          noice = true,
          dap = true,
          dap_ui = true,
          indent_blankline = {
            enabled = true,
          },
        },
      })

      vim.cmd.colorscheme("catppuccin")

      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5cc8ff", bg = "NONE" })
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#12384f", bg = "NONE" })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#071d2f" })
      vim.api.nvim_set_hl(0, "Visual", { bg = "#154861" })
    end,
  },
}

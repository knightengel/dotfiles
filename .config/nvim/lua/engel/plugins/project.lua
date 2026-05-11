return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "package.json", "pyproject.toml", "Cargo.toml", "go.mod", "Makefile" },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = true,
        silent_chdir = true,
      })

      pcall(require("telescope").load_extension, "projects")
      vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Projects" })
    end,
  },
}

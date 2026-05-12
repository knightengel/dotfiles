return {
	{
		"nvim-telescope/telescope-project.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{
				"<leader>fp",
				function()
					require("telescope").extensions.project.project({})
				end,
				desc = "Projects",
			},
		},
		config = function()
			require("telescope").load_extension("project")
		end,
	},
}

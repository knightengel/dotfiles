return {
	{
		"echasnovski/mini.nvim",
		version = false,
		event = "VeryLazy",
		config = function()
			require("mini.ai").setup({
				n_lines = 500,
			})

			require("mini.surround").setup({
				mappings = {
					add = "gsa",
					delete = "gsd",
					find = "gsf",
					find_left = "gsF",
					highlight = "gsh",
					replace = "gsr",
					update_n_lines = "gsn",

					suffix_last = "l",
					suffix_next = "n",
				},
			})

			require("mini.pairs").setup({
				modes = {
					insert = true,
					command = true,
					terminal = false,
				},
			})

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

			vim.keymap.set("n", "<leader>cw", function()
				require("mini.trailspace").trim()
			end, { desc = "Trim trailing whitespace" })

			require("mini.cursorword").setup()

			require("mini.bracketed").setup({
				buffer = { suffix = "b", options = {} },
				comment = { suffix = "c", options = {} },
				conflict = { suffix = "x", options = {} },
				diagnostic = { suffix = "d", options = {} },
				file = { suffix = "f", options = {} },
				indent = { suffix = "i", options = {} },
				jump = { suffix = "j", options = {} },
				location = { suffix = "l", options = {} },
				oldfile = { suffix = "o", options = {} },
				quickfix = { suffix = "q", options = {} },
				treesitter = { suffix = "t", options = {} },
				undo = { suffix = "u", options = {} },
				window = { suffix = "w", options = {} },
				yank = { suffix = "y", options = {} },
			})
		end,
	},

	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {
			padding = true,
			sticky = true,
			ignore = nil,

			toggler = {
				line = "<leader>/",
				block = "<leader>?",
			},

			opleader = {
				line = "<leader>/",
				block = "<leader>?",
			},

			extra = {
				above = "<leader>cO",
				below = "<leader>co",
				eol = "<leader>cA",
			},

			mappings = {
				basic = true,
				extra = true,
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>ft",
				"<cmd>TodoTelescope<cr>",
				desc = "Find TODOs",
			},
			{
				"<leader>fT",
				"<cmd>TodoTrouble<cr>",
				desc = "TODO Trouble",
			},
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next TODO",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous TODO",
			},
		},
		opts = {
			signs = true,
			sign_priority = 8,

			keywords = {
				FIX = {
					icon = "!",
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = {
					icon = "+",
					color = "info",
				},
				HACK = {
					icon = "*",
					color = "warning",
				},
				WARN = {
					icon = "!",
					color = "warning",
					alt = { "WARNING", "XXX" },
				},
				PERF = {
					icon = ">",
					color = "hint",
				},
				NOTE = {
					icon = "i",
					color = "hint",
					alt = { "INFO" },
				},
				TEST = {
					icon = "T",
					color = "test",
					alt = { "TESTING", "PASSED", "FAILED" },
				},
			},

			gui_style = {
				fg = "NONE",
				bg = "BOLD",
			},

			merge_keywords = true,

			highlight = {
				multiline = true,
				multiline_pattern = "^.",
				multiline_context = 10,
				before = "",
				keyword = "wide",
				after = "fg",
				pattern = [[.*<(KEYWORDS)\s*:]],
				comments_only = true,
				max_line_len = 400,
				exclude = {},
			},

			colors = {
				error = { "#d98aa0" },
				warning = { "#d9cb93" },
				info = { "#5cc8ff" },
				hint = { "#9fe7f7" },
				default = { "#8fb6c9" },
				test = { "#b4c5f3" },
			},

			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				pattern = [[\b(KEYWORDS):]],
			},
		},
	},
}

return {
	-- ───────────────────────────────────────────────────────────
	-- Statusline
	-- ───────────────────────────────────────────────────────────

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
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
				surface = "#12384f",
				muted = "#8fb6c9",
			}

			require("lualine").setup({
				options = {
					theme = {
						normal = {
							a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
							b = { bg = colors.surface, fg = colors.fg },
							c = { bg = "NONE", fg = colors.fg },
						},
						insert = {
							a = { bg = colors.green, fg = colors.bg, gui = "bold" },
							b = { bg = colors.surface, fg = colors.fg },
							c = { bg = "NONE", fg = colors.fg },
						},
						visual = {
							a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
							b = { bg = colors.surface, fg = colors.fg },
							c = { bg = "NONE", fg = colors.fg },
						},
						replace = {
							a = { bg = colors.red, fg = colors.bg, gui = "bold" },
							b = { bg = colors.surface, fg = colors.fg },
							c = { bg = "NONE", fg = colors.fg },
						},
						command = {
							a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
							b = { bg = colors.surface, fg = colors.fg },
							c = { bg = "NONE", fg = colors.fg },
						},
						inactive = {
							a = { bg = "NONE", fg = colors.muted },
							b = { bg = "NONE", fg = colors.muted },
							c = { bg = "NONE", fg = colors.muted },
						},
					},
					component_separators = "",
					section_separators = "",
					globalstatus = true,
					disabled_filetypes = {
						statusline = { "dashboard", "alpha", "NvimTree" },
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"branch",
						{
							"diff",
							symbols = {
								added = "+",
								modified = "~",
								removed = "-",
							},
						},
					},
					lualine_c = {
						{
							"filename",
							path = 1,
							symbols = {
								modified = " +",
								readonly = " ro",
								unnamed = "no name",
								newfile = "new",
							},
						},
					},
					lualine_x = {
						{
							"diagnostics",
							symbols = {
								error = "E:",
								warn = "W:",
								info = "I:",
								hint = "H:",
							},
						},
						"encoding",
						"filetype",
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},

	-- ───────────────────────────────────────────────────────────
	-- Nice notifications
	-- ───────────────────────────────────────────────────────────

	{
		"rcarriga/nvim-notify",
		lazy = true,
		config = function()
			require("notify").setup({
				background_colour = "#04131f",
				fps = 60,
				render = "compact",
				stages = "fade",
				timeout = 1800,
				max_width = 70,
				max_height = 12,
				icons = {
					ERROR = "x",
					WARN = "!",
					INFO = "i",
					DEBUG = "d",
					TRACE = "t",
				},
			})

			vim.notify = require("notify")
		end,
	},

	-- ───────────────────────────────────────────────────────────
	-- Fidget: clean LSP progress
	-- Вот это решает спам "✓ pyright" нормально
	-- ───────────────────────────────────────────────────────────

	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			progress = {
				poll_rate = 0,
				suppress_on_insert = true,
				ignore_done_already = true,
				ignore_empty_message = true,

				display = {
					render_limit = 3,
					done_ttl = 0.7,
					done_icon = "✓",
					done_style = "Constant",
					progress_ttl = math.huge,
					progress_icon = { "dots" },
					progress_style = "WarningMsg",
					group_style = "Title",
					icon_style = "Question",
					priority = 30,
					skip_history = true,
					format_message = function(msg)
						local message = msg.message or msg.title or ""
						if message == "" then
							return msg.lsp_client.name
						end
						return message
					end,
					format_annote = function(msg)
						return msg.title or msg.lsp_client.name
					end,
					format_group_name = function(group)
						return tostring(group)
					end,
				},
			},

			notification = {
				poll_rate = 10,
				filter = vim.log.levels.INFO,

				window = {
					normal_hl = "Comment",
					winblend = 20,
					border = "rounded",
					zindex = 45,
					max_width = 0,
					max_height = 0,
					x_padding = 1,
					y_padding = 0,
					align = "bottom",
					relative = "editor",
				},
			},
		},
	},

	-- ───────────────────────────────────────────────────────────
	-- Noice: command line, messages, hover
	-- LSP progress тут выключен, потому что его теперь делает Fidget
	-- ───────────────────────────────────────────────────────────

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
				max_width = 70,
				max_height = 12,
				icons = {
					ERROR = "x",
					WARN = "!",
					INFO = "i",
					DEBUG = "d",
					TRACE = "t",
				},
			})

			vim.notify = require("notify")

			require("noice").setup({
				lsp = {
					progress = {
						enabled = false,
					},

					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},

					hover = {
						enabled = true,
						silent = false,
					},

					signature = {
						enabled = false,
					},

					message = {
						enabled = true,
						view = "notify",
					},
				},

				cmdline = {
					enabled = true,
					view = "cmdline_popup",
					format = {
						cmdline = { pattern = "^:", icon = ":", lang = "vim" },
						search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
						search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
						filter = { pattern = "^:%s*!", icon = "!", lang = "bash" },
						lua = { pattern = "^:%s*lua%s+", icon = "lua", lang = "lua" },
						help = { pattern = "^:%s*he?l?p?%s+", icon = "help" },
					},
				},

				messages = {
					enabled = true,
					view = "notify",
					view_error = "notify",
					view_warn = "notify",
					view_history = "messages",
					view_search = "virtualtext",
				},

				popupmenu = {
					enabled = true,
					backend = "nui",
				},

				redirect = {
					view = "popup",
					filter = { event = "msg_show" },
				},

				routes = {
					-- Не показывать "written", "yanked" и другой мелкий шум
					{
						filter = {
							event = "msg_show",
							any = {
								{ find = "%d+B written" },
								{ find = "%d+L, %d+B" },
								{ find = "; after #%d+" },
								{ find = "; before #%d+" },
								{ find = "%d+ fewer lines" },
								{ find = "%d+ more lines" },
							},
						},
						opts = { skip = true },
					},

					-- Длинные сообщения отправлять в split
					{
						filter = {
							event = "msg_show",
							min_height = 10,
						},
						view = "split",
					},
				},

				views = {
					cmdline_popup = {
						position = {
							row = "35%",
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						filter_options = {},
						win_options = {
							winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
							winblend = 10,
						},
					},

					popup = {
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
							winblend = 10,
						},
					},

					hover = {
						border = {
							style = "rounded",
						},
						win_options = {
							winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
							winblend = 10,
						},
					},
				},

				presets = {
					bottom_search = false,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = true,
				},
			})
		end,
	},

	-- ───────────────────────────────────────────────────────────
	-- Which-key
	-- ───────────────────────────────────────────────────────────

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
					padding = { 1, 2 },
					wo = {
						winblend = 10,
					},
				},
				layout = {
					width = { min = 20, max = 50 },
					spacing = 3,
				},
			})
		end,
	},

	-- ───────────────────────────────────────────────────────────
	-- Dashboard
	-- ───────────────────────────────────────────────────────────

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
				dashboard.button("p", "projects", "<cmd>Telescope project<cr>"),
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

	-- ───────────────────────────────────────────────────────────
	-- Indent guides
	-- ───────────────────────────────────────────────────────────

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("ibl").setup({
				indent = {
					char = "│",
					tab_char = "│",
				},
				scope = {
					enabled = true,
					char = "│",
					show_start = false,
					show_end = false,
				},
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"dashboard",
						"NvimTree",
						"lazy",
						"mason",
						"notify",
						"toggleterm",
					},
				},
			})
		end,
	},

	-- ───────────────────────────────────────────────────────────
	-- Highlight word under cursor
	-- ───────────────────────────────────────────────────────────

	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("illuminate").configure({
				delay = 160,
				large_file_cutoff = 2000,
				large_file_overrides = {
					providers = { "lsp" },
				},
				filetypes_denylist = {
					"dirbuf",
					"dirvish",
					"fugitive",
					"NvimTree",
					"alpha",
					"dashboard",
					"lazy",
					"mason",
				},
			})
		end,
	},
}

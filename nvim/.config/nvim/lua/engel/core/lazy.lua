local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local result = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ result, "WarningMsg" },
		}, true, {})
		return
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "engel.plugins" },
	},

	defaults = {
		lazy = false,
		version = false,
	},

	install = {
		colorscheme = { "catppuccin" },
	},

	checker = {
		enabled = true,
		notify = false,
		frequency = 86400,
	},

	change_detection = {
		enabled = true,
		notify = false,
	},

	rocks = {
		enabled = true,
		hererocks = true,
	},

	ui = {
		border = "rounded",
		backdrop = 70,

		icons = {
			cmd = "cmd",
			config = "cfg",
			event = "event",
			ft = "ft",
			init = "init",
			import = "import",
			keys = "keys",
			lazy = "lazy",
			loaded = "ok",
			not_loaded = "no",
			plugin = "plugin",
			runtime = "rtp",
			require = "req",
			source = "src",
			start = "start",
			task = "task",
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		},
	},

	diff = {
		cmd = "git",
	},

	dev = {
		path = "~/projects",
		patterns = {},
		fallback = false,
	},

	profiling = {
		loader = false,
		require = false,
	},

	performance = {
		cache = {
			enabled = true,
		},

		reset_packpath = true,
		rtp = {
			reset = true,
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrw",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

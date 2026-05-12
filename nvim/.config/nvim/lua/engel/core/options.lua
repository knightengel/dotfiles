local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.wrap = false
opt.linebreak = true
opt.scrolloff = 10
opt.sidescrolloff = 10

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.splitbelow = true
opt.splitright = true
opt.equalalways = false

opt.clipboard = "unnamedplus"
opt.mouse = "a"

opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.updatetime = 200
opt.timeoutlen = 400
opt.ttimeoutlen = 10

opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 12

opt.showmode = false
opt.cmdheight = 1
opt.laststatus = 3

opt.list = true
opt.listchars = {
  tab = "  ",
  trail = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "␣",
}

opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
  diff = "╱",
}

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = false
opt.foldlevel = 99

opt.virtualedit = "block"
opt.inccommand = "split"
opt.confirm = true
opt.conceallevel = 2

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

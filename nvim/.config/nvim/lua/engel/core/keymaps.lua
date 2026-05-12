local map = vim.keymap.set

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

map("n", "<leader>w", "<cmd>w<cr>", opts("Save"))
map("n", "<leader>q", "<cmd>q<cr>", opts("Quit"))
map("n", "<leader>Q", "<cmd>qa<cr>", opts("Quit all"))

map("n", "<esc>", "<cmd>nohlsearch<cr>", opts("Clear search"))

map("n", "<leader>sv", "<cmd>vsplit<cr>", opts("Vertical split"))
map("n", "<leader>sh", "<cmd>split<cr>", opts("Horizontal split"))

map("n", "<C-h>", "<C-w>h", opts("Focus left"))
map("n", "<C-j>", "<C-w>j", opts("Focus down"))
map("n", "<C-k>", "<C-w>k", opts("Focus up"))
map("n", "<C-l>", "<C-w>l", opts("Focus right"))

map("n", "<A-h>", "<cmd>vertical resize -4<cr>", opts("Resize left"))
map("n", "<A-l>", "<cmd>vertical resize +4<cr>", opts("Resize right"))
map("n", "<A-j>", "<cmd>resize -2<cr>", opts("Resize down"))
map("n", "<A-k>", "<cmd>resize +2<cr>", opts("Resize up"))

map("v", "<", "<gv", opts("Indent left"))
map("v", ">", ">gv", opts("Indent right"))

map("n", "J", "mzJ`z", opts("Join lines"))
map("n", "<C-d>", "<C-d>zz", opts("Half page down"))
map("n", "<C-u>", "<C-u>zz", opts("Half page up"))
map("n", "n", "nzzzv", opts("Next search"))
map("n", "N", "Nzzzv", opts("Previous search"))

map("x", "<leader>p", [["_dP]], opts("Paste without yanking"))
map({ "n", "v" }, "<leader>y", [["+y]], opts("Yank to clipboard"))
map("n", "<leader>Y", [["+Y]], opts("Yank line to clipboard"))

map({ "n", "v" }, "<leader>d", [["_d]], opts("Delete without yanking"))

map("n", "<leader>bn", "<cmd>bnext<cr>", opts("Next buffer"))
map("n", "<leader>bp", "<cmd>bprevious<cr>", opts("Previous buffer"))
map("n", "<leader>bd", "<cmd>bdelete<cr>", opts("Delete buffer"))

map("n", "<leader>tn", "<cmd>tabnew<cr>", opts("New tab"))
map("n", "<leader>to", "<cmd>tabonly<cr>", opts("Only tab"))
map("n", "<leader>tc", "<cmd>tabclose<cr>", opts("Close tab"))
map("n", "<leader>tl", "<cmd>tabnext<cr>", opts("Next tab"))
map("n", "<leader>th", "<cmd>tabprevious<cr>", opts("Previous tab"))

map("n", "<leader>x", "<cmd>source %<cr>", opts("Source current file"))

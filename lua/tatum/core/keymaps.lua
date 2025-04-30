local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- n = normal
-- i = insert
-- v = visual
-- x = block
-- t = terminal
-- c = commmand

keymap("i", "jk", "<ESC>", opts)
keymap({ "n", "v" }, "<leader>y", [["+y]], opts)

keymap("n", "<leader>vs", "<CMD>vsplit<CR>", opts)
keymap("n", "<leader>hs", "<CMD>split<CR>", opts)

-- Tab Navigation
keymap("n", "<A-j>", "<CMD>tabprev<CR>", opts)
keymap("n", "<A-k>", "<CMD>tabnext<CR>", opts)
--keymap("n", "<Leader>h", "<CMD>tabprev<CR>", opts)
--keymap("n", "<Leader>l", "<CMD>tabnext<CR>", opts)

-- Buffer Navigation
keymap("n", "<S-h>", "<CMD>bprev<CR>", opts)
keymap("n", "<S-l>", "<CMD>bnext<CR>", opts)
keymap("n", "<leader>bd", "<CMD>bdelete<CR>", opts)
keymap("n", "<leader>bq", "<CMD>%bdelete|e#|bd#<CR>", opts)

-- File Input/Output
keymap("n", "<leader>w", "<CMD>write<CR>", opts)
keymap("n", "<leader>q", "<CMD>quit!<CR>", opts)

-- Automatic Brace
keymap("i", ",.", "<ESC>A{<CR>}<ESC>ko", opts)

-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
-- keymap("v", "<S-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("v", "<S-k>", ":move '<-2<CR>gv-gv", opts)

-- Window Resize
keymap("n", "<C-Left>", "<CMD>vertical-resize -2<CR>", opts)
keymap("n", "<C-Down>", "<CMD>resize -1<CR>", opts)
keymap("n", "<C-Up>", "<CMD>resize +1<CR>", opts)
keymap("n", "<C-Right>", "<CMD>vertical-resize +2<CR>", opts)

-- Nvim Tree
-- keymap("n", "<C-f>", "<CMD>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>t", "<CMD>NvimTreeToggle<CR>", opts)

-- Conform.nvim
keymap("n", "<leader>F", '<CMD>lua require("conform").format()<CR>', opts)

-- LaTeX Compile
keymap("n", "<leader>l", "<CMD>!xelatex '%'<CR>", opts)
keymap("n", "<leader>k", "<CMD>!xelatex --shell-escape 'main'<CR>", opts)

-- Telescope
-- keymap('n', '<leader>ff', '<CMD>Telescope find_files<CR>', opts)
-- keymap('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', opts)
-- keymap('n', '<leader>fb', '<CMD>Telescope buffers<CR>', opts)
-- keymap('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', opts)

-- Fzf-lua
keymap("n", "<leader>ff", "<CMD>FzfLua files<CR>", opts)
keymap("n", "<leader>fg", "<CMD>FzfLua live_grep_native<CR>", opts)
keymap("n", "<leader>fb", "<CMD>FzfLua buffers<CR>", opts)
keymap("n", "<leader>fh", "<CMD>FzfLua helptags<CR>", opts)

-- Noice
keymap("n", "<leader>nd", "<CMD>NoiceDismiss<CR>", opts)

-- Silicon
keymap("v", "<leader>sc", "<CMD>Silicon<CR>", opts)

-- Markdown Preview
keymap("n", "<leader>m", "<CMD>MarkdownPreviewToggle<CR>", opts)

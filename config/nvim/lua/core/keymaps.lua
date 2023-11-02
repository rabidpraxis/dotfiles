-- Remap space as leader key

local map = require('core/utils').keymap

-- General
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Commmand line
map("c", "<C-w>", "<S-Right>")
map("c", "<C-b>", "<S-Left>")
map("c", "<C-l>", "<Right>")
map("c", "<C-h>", "<Left>")
map("c", "<C-j>", "<Down>")
map("c", "<C-k>", "<Up>")
map("c", "<C-a>", "<C-e>")
map("c", "<C-i>", "<C-b>")
map("c", "<C-x>", "<Del>")
map("c", "<C-d>", "<C-u>")
map("c", "<C-p>", "<C-r>*")

-- Open tree
map("n", "<leader>v", "<Cmd>NvimTreeToggle<CR>")

-- Better movement
map("n", "j", "gj")
map("n", "k", "gk")

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Window Splits
map("n", "<leader>s", "<Cmd>:vsplit<CR>")

-- LSP
map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")

-- Files
map("n", "<c-p>", "<Cmd>Files<CR>")
map("n", "<leader><leader>", "<Cmd>Telescope<CR>")
map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<Cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>")

-- DiffView
map("n", "<leader>dd", "<Cmd>DiffviewOpen<CR>")
map("n", "<leader>dc", "<Cmd>DiffviewClose<CR>")

-- Testing
map("n", "<leader>tn", "<Cmd>TestNearest<CR>")
map("n", "<leader>tt", "<Cmd>TestFile<CR>")
map("n", "<leader>ta", "<Cmd>TestSuite<CR>")
map("n", "<leader>tl", "<Cmd>TestLast<CR>")
map("n", "<leader>tg", "<Cmd>TestVisit<CR>")

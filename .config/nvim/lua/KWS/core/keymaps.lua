M = {}
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap SPACE as a leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Press ESC to set nohlsearch mode
keymap("n", "<esc>", ":nohlsearch <CR>", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("n", "<leader>dr", ":!clang++ -Wall % && ./a.out<CR>", opts)

-- Resizing
keymap("n", "<C-a>l", ":vertical resize +4<CR>", opts)
keymap("n", "<C-a>h", ":vertical resize -4<CR>", opts)
keymap("n", "<C-a>k", ":horizontal resize -4<CR>", opts)
keymap("n", "<C-a>j", ":horizontal resize +4<CR>", opts)

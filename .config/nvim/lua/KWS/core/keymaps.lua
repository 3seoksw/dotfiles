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

-- Plugin Keymaps Below

-- nvim-tree
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- VimTex
keymap("n", "<leader>ll", ":VimtexCompile<CR>", opts)
keymap("n", "<leader>li", ":VimtexInfo<CR>", opts)
keymap("n", "<leader>lw", ":VimtexView<CR>", opts)

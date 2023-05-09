M = {}
lvim.leader = "space"

local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- Press ESC to set nohlsearch mode
keymap("n", "<esc>", ":nohlsearch <CR>", opts)

-- Page Down while cursor in the middle
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)


-----------------------
-- Plugins' Keymaps --
-----------------------

-- VimTex
keymap("n", "<\\>ll", ":VimtexCompile<CR>", opts)
keymap("n", "<\\>li", ":VimtexInfo<CR>", opts)
keymap("n", "<\\>lw", ":VimtexView<CR>", opts)

-- Markdown Preview
keymap("n", "<space>mm", ":MarkdownPreview <CR>", opts)

-- Bufferline
keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)

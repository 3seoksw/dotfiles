local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}

function M.config()
	local wk = require("which-key")
	wk.add({
		-- Telescope
		{ "<leader>f", group = "Telescope", icon = " " },
		{ "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Fuzzy find files in cwd" },
		{ "<leader>fr", "<CMD>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
		{ "<leader>fs", "<CMD>Telescope live_grep<cr>", desc = "Find string in cwd" },
		{ "<leader>fc", "<CMD>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },

		-- LSP
		{ "g", group = "LSP", icon = " " },
		{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
		{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover details" },
		{ "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "List all the implementations" },
		{ "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Go to references" },
		{ "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Diagnostics" },

		-- nvim-tree
		{ "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Toggle nvim-tree" },

		-- DAP
		{ "<leader>d", group = "DAP", icon = " " },
		{ "<leader>db", ":DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
		{ "<leader>dr", "<CMD>lua require('dapui').toggle()<CR>", desc = "Toggle DAP UI" },

		-- swenv
		{ "<leader>P", group = "Python", icon = " " },
		{ "<leader>Pe", "<CMD>lua require('swenv.api').pick_venv()<CR>", desc = "Switch env" },

		-- LazyGit
		{ "<leader>g", group = "LazyGit", icon = " " },
		{ "<leader>gg", ":LazyGit<CR>", desc = "Open LazyGit Pannel" },

		-- Vimtex
		{ "<leader>V", group = "VimTeX", icon = " " },
		{ "<leader>Vc", ":VimtexCompile<CR>", desc = "Compile TeX File" },
		{ "<leader>Vi", ":VimtexInfo<CR>", desc = "Open VimTeX Info" },
		{ "<leader>Vv", ":VimtexView<CR>", desc = "View VimTeX" },

		-- Symbols Outline
		{ "<leader>o", group = "Symbols Outline", icon = " " },
		{ "<leader>os", ":SymbolsOutline<CR>", desc = "Toggle Symbols Outline" },

		-- Markdown
		{ "<leader>m", group = "Markdown", icon = " " },
		{ "<leader>mm", ":MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" },
	})
end

return M

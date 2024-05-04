local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local mappings = {
		["q"] = { "<cmd>confirm q<CR>", "Quit" },
		["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
		["v"] = { "<cmd>vsplit<CR>", "Split" },
		p = {
			name = "Plugins",
			i = { "<cmd>Lazy install<cr>", "Install" },
			s = { "<cmd>Lazy sync<cr>", "Sync" },
			S = { "<cmd>Lazy clear<cr>", "Status" },
			c = { "<cmd>Lazy clean<cr>", "Clean" },
			u = { "<cmd>Lazy update<cr>", "Update" },
			p = { "<cmd>Lazy profile<cr>", "Profile" },
			l = { "<cmd>Lazy log<cr>", "Log" },
			d = { "<cmd>Lazy debug<cr>", "Debug" },
		},

		f = {
			name = "Find",
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			f = { "<cmd>Telescope find_files<cr>", "Find files" },
			p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
			t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
			s = { "<cmd>Telescope grep_string<cr>", "Find String" },
			h = { "<cmd>Telescope help_tags<cr>", "Help" },
			H = { "<cmd>Telescope highlights<cr>", "Highlights" },
			i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
			l = { "<cmd>Telescope resume<cr>", "Last Search" },
			M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			C = { "<cmd>Telescope commands<cr>", "Commands" },
		},

		l = {
			name = "LSP",
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			d = { "<cmd>Trouble<cr>", "Diagnostics" },
			-- d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
			-- w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
			-- f = { "<cmd>lua vim.lsp.buf.format({timeout_ms = 1000000})<cr>", "Format" },
			f = {
				"<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
				"Format",
			},
			i = { "<cmd>LspInfo<cr>", "Info" },
			I = { "<cmd>Mason<cr>", "Mason Info" },
			j = {
				"<cmd>lua vim.diagnostic.goto_next()<cr>",
				"Next Diagnostic",
			},
			h = { "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
			k = {
				"<cmd>lua vim.diagnostic.goto_prev()<cr>",
				"Prev Diagnostic",
			},
			l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			S = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
			e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
		},

		P = {
			name = "Python",
			e = { "<cmd>lua require('swenv.api').pick_venv()<CR>", "Choose Env" },
		},

		m = {
			name = "markdown",
			m = { "<cmd>MarkdownPreview <CR>", "Markdown Preview" },
			M = { "<cmd>PeekOpen<CR>", "Peek Markdown Preview" },
		},

		d = {
			name = "dap",
			m = { "<cmd>lua require('neotest').run.run()<CR>", "Test Method" },
			M = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", "Test Method DAP" },
			f = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
			F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" },
			U = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle DAP UI" },
			b = { "<cmd>DapToggleBreakpoint <CR>", "Add breakpoint" },
			c = { "<cmd>DapContinue <CR>", "Start or continue" },
			s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
			r = { ":!clang++ -Wall % && ./a.out<CR>", "Compile and Run" },
		},
		--c = {
		--	name = "CodeSnap",
		--	c = { "<cmd>CodeSnap<CR>", "Save selected code snapshot into clipboard" },
		--	s = { "<cmd>CodeSnapSave<CR>", "Save selected code snapshot into `~/Pictures`" },
		--},
	}

	local opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	vim.o.timeout = true
	vim.o.timeoutlen = 300

	local wk = require("which-key")
	wk.register(mappings, opts)
end

return M

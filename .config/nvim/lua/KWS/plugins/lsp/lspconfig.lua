local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
			"folke/neodev.nvim",
		},
	},
}

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

M.on_attach = function(client, bufnr)
	if client.supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true, { bufnr })
	end
end

M.toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr }), { bufnr })
end

function M.common_capabilities()
	local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if status_ok then
		return cmp_nvim_lsp.default_capabilities()
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}

	return capabilities
end

function M.config()
	local lspconfig = require("lspconfig")

	-- Disable LSP diagnostics virtual texts
	vim.diagnostic.config({
		virtual_text = false,
		underline = true,
		signs = true,
	})

	local servers = {
		"lua_ls",
		"cssls",
		"html",
		"astro",
		"pyright",
		"bashls",
		"jsonls",
		"yamlls",
		"marksman",
		"tailwindcss",
		"eslint",
		"rust_analyzer",
		"clangd",
		"ts_ls",
		"texlab",
	}

	-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
	-- for type, icon in pairs(signs) do
	-- 	local hl = "DiagnosticSign" .. type
	-- 	use vim.diagnostic.config() instead.
	-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	-- end
	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.HINT] = "󰠠 ",
				[vim.diagnostic.severity.INFO] = " ",
			},
		},
	})

	for _, server in pairs(servers) do
		local opts = {
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
		}

		if server == "pyright" then
			local python_root_files = {
				"pyproject.toml",
				"setup.py",
				"setup.cfg",
				"requirements.txt",
				"Pipfile",
				"pyrightconfig.json",
			}
			lspconfig["pyright"].setup({
				on_attach = M.on_attach,
				capabilities = M.common_capabilities(),
				root_dir = lspconfig.util.root_pattern(unpack(python_root_files)),
			})
		end

		-- see the following
		-- https://www.reddit.com/r/neovim/comments/16p1e89/masonnvim_clangd_not_finding_header_files/
		if server == "clangd" then
			lspconfig["clangd"].setup({
				on_attach = function(client, bufnr)
					client.server_capabilities.signatureHelpProvider = false
					M.on_attach(client, bufnr)
				end,
				capabilities = M.common_capabilities,
			})
		end

		if server == "lua_ls" then
			require("neodev").setup({})
			lspconfig["lua_ls"].setup({
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
		end

		lspconfig[server].setup(opts)
	end
end

return M

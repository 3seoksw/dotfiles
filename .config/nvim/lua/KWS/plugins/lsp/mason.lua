local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"nvim-lua/plenary.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
}

M.servers = {
	"lua_ls",
	"cssls",
	"html",
	"ts_ls",
	"astro",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"marksman",
	"tailwindcss",
	"rust_analyzer",
	"clangd",
}

function M.config()
	require("mason").setup({
		ui = {
			border = "rounded",
		},
	})
	require("mason-lspconfig").setup({
		ensure_installed = M.servers,
	})
	require("mason-tool-installer").setup({
		ensure_installed = {
			"prettier", -- prettier formatter
			"stylua", -- lua formatter
			"isort", -- python formatter
			"black", -- python formatter
			"pylint", -- python linter
			--"eslint_d", -- js linter
			"eslint", -- js linter
			"clang-format",
			"codelldb",
			"debugpy",
		},
	})
end

return M

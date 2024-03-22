local M = {
	"nvim-neotest/neotest",
	dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
	},
}

function M.config()
	require("neotest").setup({
		adapters = {
			require("neotest-python")({
				dap = {
					justMyCode = false,
					console = "integratedTerminal",
				},
				args = { "--log-level", "DEBUG" },
				runner = "pytest",
			}),
		},
	})
end

return M

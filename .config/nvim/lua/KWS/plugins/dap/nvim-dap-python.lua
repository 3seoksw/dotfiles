local M = {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
}

function M.config()
	local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
	require("dap-python").setup(path)
end

return M

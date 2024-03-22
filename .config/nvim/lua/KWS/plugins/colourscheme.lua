local M = {
	"neanias/everforest-nvim",
	lazy = false,
	priority = 1000,
}

function M.config()
	-- vim.cmd([[colorscheme tokyonight-moon]])
	require("everforest").setup({
		background = "hard",
	})
	vim.cmd([[colorscheme everforest]])
end

return M

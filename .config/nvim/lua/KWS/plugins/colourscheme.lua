local M = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
}

function M.config()
	--vim.cmd([[colorscheme tokyonight-night]])
	vim.cmd([[colorscheme tokyonight-moon]])
end

return M

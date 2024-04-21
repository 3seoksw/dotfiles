return {
	"neanias/everforest-nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("everforest").setup({
			background = "hard",
		})
		vim.cmd([[colorscheme everforest]])
	end,
}
--return {
--	"folke/tokyonight.nvim",
--	lazy = false,
--	priority = 1000,
--	opts = {},
--	config = function()
--		vim.cmd([[colorscheme tokyonight]])
--	end,
--}

return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nordic").setup({
			transparent = {
				bg = false,
				float = false,
			},
			cursorline = {
				theme = "light",
			},
		})
		-- vim.cmd("colorscheme nordic")
	end,
}

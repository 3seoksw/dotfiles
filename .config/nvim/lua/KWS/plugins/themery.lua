return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = { "kanagawa-wave", "everforest" },
			-- add the config here
		})
	end,
}

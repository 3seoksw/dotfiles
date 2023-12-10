local M = {
	"nvim-lualine/lualine.nvim",
}

function M.config()
	require("lualine").setup({
		options = {
			theme = "tokyonight",
			--section_separators = { left = '', right = '' },
			--component_separators = { left = '', right = '' }
			--component_separators = { left = "", right = "" },
			--section_separators = { left = "", right = "" },

			ignore_focus = { "NvimTree" },
		},
	})
end

return M

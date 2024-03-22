local M = {
	"nvim-lualine/lualine.nvim",
}

function M.config()
	require("lualine").setup({
		options = {
			theme = "everforest",
			--section_separators = { left = '', right = '' },
			--component_separators = { left = '', right = '' }
			--component_separators = { left = "", right = "" },
			--section_separators = { left = "", right = "" },

			ignore_focus = { "NvimTree" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			--lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_x = { { "swenv", icon = "" } },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	})
end

return M

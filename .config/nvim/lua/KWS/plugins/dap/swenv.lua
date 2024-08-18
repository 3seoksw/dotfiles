local M = {
	"AckslD/swenv.nvim",
}

function M.config()
	require("swenv").setup({
		get_venvs = function(venvs_path)
			return require("swenv.api").get_venvs(venvs_path)
		end,
	})
end

return M

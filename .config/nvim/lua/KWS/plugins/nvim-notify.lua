local M = { "rcarriga/nvim-notify" }

function M.config()
	require("notify").setup({
		fps = 60,
		render = "wrapped-compact",
		max_width = 50,
		timeout = 3000,
	})
end

return M

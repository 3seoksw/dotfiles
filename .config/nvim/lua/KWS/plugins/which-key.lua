local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local mappings = {
		["q"] = { "<cmd>confirm q<CR>", "Quit" },
	}

	local opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	vim.o.timeout = true
	vim.o.timeoutlen = 300

	local wk = require("which-key")
	wk.register(mappings, opts)
end

return M

local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
}

function M.config()
	local treesitter = require("nvim-treesitter.configs")

	-- configure treesitter
	treesitter.setup({ -- enable syntax highlighting
		highlight = {
			enable = true,
		},
		-- enable indentation
		indent = { enable = true },
		-- enable autotagging (w/ nvim-ts-autotag plugin)
		autotag = {
			enable = true,
		},
		-- ensure these language parsers are installed
		ensure_installed = {
			"javascript",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"java",
			"c",
			"rust",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M

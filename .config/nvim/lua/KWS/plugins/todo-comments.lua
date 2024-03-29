return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#E67E80" },
			warning = { "DiagnosticWarn", "WarningMsg", "#DBBC7F" },
			info = { "DiagnosticInfo", "#7FBBB3" },
			hint = { "DiagnosticHint", "#63C092" },
			default = { "Identifier", "#4C3743" },
			test = { "Identifier", "#D699B6" },
		},
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}

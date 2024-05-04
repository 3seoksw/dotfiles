local M = {
	"mistricky/codesnap.nvim",
	build = "make",
}

function M.config()
	require("codesnap").setup({
		mac_window_bar = false,
		watermark = "",
		save_path = "~/Pictures",
		has_breadcrumbs = true,
		bg_theme = "bamboo",
		bg_color = "#535c68",
		code_font_family = "JetBrains Mono",
	})
end

return M

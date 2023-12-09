return {
	"kdheepak/lazygit.nvim",
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	vim.cmd([[nnoremap <silent> <leader>gg :LazyGit<CR>]]),
}

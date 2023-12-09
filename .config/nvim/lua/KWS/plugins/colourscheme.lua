local M = {
	'AlexvZyl/nordic.nvim',
  priority = 1000,
}

function M.config()
  vim.cmd([[colorscheme nordic]])
end

return M

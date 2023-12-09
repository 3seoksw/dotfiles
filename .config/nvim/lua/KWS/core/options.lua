local options = {
	number = true,			-- enable line number
	relativenumber = true,	-- enable relative line number
	mouse = "a",			-- allow the mouse to be used
	cursorline = true,		-- highlight the current line
	smartcase = true,
	smartindent = true, 	-- make indenting smarter
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 0,
	errorbells = true,
	incsearch = true,
	scrolloff = 8,
	termguicolors = true,
	hlsearch = true,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd ("set clipboard=unnamed")
vim.cmd ("set whichwrap+=<,>,[,],h,l")
vim.cmd ("set iskeyword+=-")
vim.cmd ("set formatoptions-=cro") -- TODO: this doesn't seem to work

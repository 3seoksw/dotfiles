return {
	"lervag/vimtex",
	event = { "VeryLazy" },
	init = function()
		vim.cmd([[
      filetype plugin indent on
      syntax enable
      let g:vimtex_view_method = "skim"
      let g:vimtex_view_general_viewer = "okular"
      let g:vimtex_view_general_options = "--unique file:@pdf\#src:@line@tex"
      let g:vimtex_compiler_latexmk_engines = {
      \ '_'                : '-xelatex',
      \}
    ]])
	end,
}
--      let g:vimtex_compiler_latexmk_engines = {
--      \ '_'                : '-xelatex',
--      \}
--      let g:vimtex_compiler_method = "latexmk"

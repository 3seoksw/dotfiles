lvim.plugins = {
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#inStall"]()
        end,
    },
    { "lervag/vimtex" },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    { "terrastruct/d2-vim" },
    { "goerz/jupytext.vim" },
    { 'norcalli/nvim-colorizer.lua' },
    { 'catppuccin/nvim' },
    { 'AlexvZyl/nordic.nvim' },
}

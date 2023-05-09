local nvimtree = lvim.builtin.nvimtree.setup

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.respect_buf_cwd = true
nvimtree.update_cwd = true
nvimtree.update_focused_file = { enable = true, update_cwd = true }

nvimtree.renderer = {
    icons = {
        glyphs = {
            folder = {
                arrow_closed = "", -- arrow when folder is closed
                arrow_open = "", -- arrow when folder is open
            },
        },
    },
}

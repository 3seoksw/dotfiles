lvim.format_on_save = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {
        command = "prettier",
        filetypes = { "typescript", "html", "css", "javascript", "javascriptreact" },
    },
}

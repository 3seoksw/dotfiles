lvim.builtin.lualine.style = "default"

local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch" }
lvim.builtin.lualine.sections.lualine_c = { "filename", components.diff }


lvim.builtin.lualine.sections.lualine_x = {
    components.encoding,
    "fileformat",
    components.lsp,
}
lvim.builtin.lualine.sections.lualine_y = {
    components.filetype
}
lvim.builtin.lualine.sections.lualine_z = {
    components.location,
    "progress"
}

lvim.builtin.lualine.options.theme = "nordic"

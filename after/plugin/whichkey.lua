vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").setup({})

local mapping = {
    t = {
        name = "terminal",
    },
    l = {
        name = "lsp",
    },
    h = {
        name = "harpoon"
    },
    [";"] = {
        name = "toggles"
    },
}

require("which-key").register(mapping, {prefix="<leader>"})

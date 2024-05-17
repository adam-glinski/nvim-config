
return {
    "folke/which-key.nvim",
    config = function ()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        require("which-key").setup({})

        local mapping = {
            f = {
                name = "find",
            },
            t = {
                name = "terminal",
            },
            l = {
                name = "lsp",
            },
            h = {
                name = "harpoon"
            },
            d = {
                name = "dap"
            },
            g = {
                name = "git"
            },
            [";"] = {
                name = "toggles"
            },
        }

        require("which-key").register(mapping, {prefix="<leader>"})
    end
}

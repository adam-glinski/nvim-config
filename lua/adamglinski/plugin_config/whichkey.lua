
return {
    "folke/which-key.nvim",
    dependencies = {
        { 'echasnovski/mini.icons', version = false },
    },
    config = function ()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require("which-key")

        local mapping = {
            { "<leader>;", group = "toggles" },
            { "<leader>d", group = "debug" },
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
            { "<leader>h", group = "harpoon" },
            { "<leader>l", group = "lsp" },
            { "<leader>t", group = "terminal" },
        }
        wk.add(mapping)
        -- require("which-key").register(mapping, {prefix="<leader>"})
    end
}

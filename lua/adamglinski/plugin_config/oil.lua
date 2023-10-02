-- Issue: Its a bit slow

return {
    'stevearc/oil.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function ()
        local oil = require("oil")
        oil.setup({
            columns = {
                "icon",
            },
            view_options = {
                show_hidden = true,
            },
            win_options = {
                nu = false,
                rnu = false,
            }
        })

        vim.keymap.set("n", "<leader>e", function() oil.open_float() end, {desc = "Open directory in floating window"})
    end
}



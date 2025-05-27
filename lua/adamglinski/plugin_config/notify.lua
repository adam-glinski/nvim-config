return {
    'rcarriga/nvim-notify',
    config = function ()
        -- vim.notify = require("notify")
        --
        -- vim.notify.setup{
        --     render = "default",
        --     background_color = "#000000"
        -- }

        require("notify").setup({
            render = "default",
            background_color = "#000000"
        })
    end
}

-- vim.api.nvim_get_hl_by_name

return {
    'rcarriga/nvim-notify',
    config = function ()
        vim.notify = require("notify")

        vim.notify.setup{
            render = "default",
        }
    end
}

-- vim.api.nvim_get_hl_by_name

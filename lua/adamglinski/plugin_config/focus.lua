
return {
    'nvim-focus/focus.nvim',
    config = function ()
        local focus = require("focus")
        focus.setup({
            ui = {
                hybridnumber = false,
                absolutenumber_unfocussed = false,
                cursorline = false,
            },
            config = {
                autoresize = {
                    enable = false,
                }
            }
        })

        function ToggleNumbersInBuffer()
            focus.config.ui.hybridnumber = not focus.config.ui.hybridnumber
            focus.config.ui.absolutenumber_unfocussed = not focus.config.ui.absolutenumber_unfocussed
            vim.opt.nu = not vim.opt.nu
            vim.opt.relativenumber = not vim.opt.relativenumber
        end

        function ToggleAutoFocus()
            focus.config.autoresize.enable = not focus.config.autoresize.enable
        end
        focus.config.autoresize.enable = false

        vim.keymap.set("n", "<leader>;f", function () ToggleAutoFocus() end, { desc = "Toggle split autofocus." })
        vim.keymap.set("n", "<leader>;n", function () ToggleNumbersInBuffer() end, { desc = "Toggle focus line numbers." })
    end
}


return {
    'nvim-focus/focus.nvim',
    config = function ()
        local focus = require("focus")
        focus.setup({
            ui = {
                hybridnumber = true,
                absolutenumber_unfocussed = true,
                cursorline = false,
            },
            config = {
                autoresize = {
                    enable = true,
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

        vim.keymap.set("n", "<leader>;f", function () ToggleAutoFocus() end, { desc = "Toggle split autofocus." })
    end

}

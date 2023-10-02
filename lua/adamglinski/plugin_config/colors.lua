return {
    'luisiacc/gruvbox-baby',
    priority = 1000,
    branch = "main",
    config = function ()
        vim.g.gruvbox_baby_telescope_theme = 1
        -- vim.g.gruvbox_baby_transparent_mode = 1
        function SetColor(color)
            color = color or "gruvbox-baby" -- gruvbox is now deafult colorscheme
            vim.cmd.colorscheme(color)

            -- NOTE: For transparent mode
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end

        SetColor()
    end
}

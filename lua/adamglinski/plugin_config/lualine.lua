
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local custom_gruvbox_baby = require'lualine.themes.gruvbox-baby'
        local c = require("gruvbox-baby.colors").config()

        custom_gruvbox_baby.inactive = {
            a = { bg = c.background, fg = c.gray, gui = "bold" },
            b = { bg = c.background, fg = c.gray },
            c = { bg = c.background, fg = c.gray },
        }
        require('lualine').setup {
            options = {
                -- fmt = string.lower,
                theme = custom_gruvbox_baby,
                -- theme = "gruvbox-baby",
                -- theme = "gruvbox",
                -- color = {
                    --     bg = "#a99a85"
                    -- }
                    -- component_separators = { left = '', right = ''},
                    component_separators = { left = '/', right = '/'},
                    -- section_separators = { left = '', right = ''},
                    -- section_separators = { left = '', right = ''},
                }
            }
    end
}

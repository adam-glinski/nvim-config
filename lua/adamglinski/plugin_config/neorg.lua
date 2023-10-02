return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {"nvim-lua/plenary.nvim"},
    lazy = "true",
    event = "BufEnter",
    config = function ()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        notes = "~/notes",
                        studia = "E:\\!Studia\\pre_notatki",
                    },
                },
            },
        }
    }
    end
}

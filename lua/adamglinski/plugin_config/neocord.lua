return {
    'IogaMaster/neocord',
    event = "VeryLazy",
    config = function ()
        require("neocord").setup({
            logo = "https://i.imgur.com/c9AaALT.png",
            global_timer = true,
            log_level = "none"
            -- TODO: Make pr to implement this (simple fix just add this in their log.lua: )
            -- Log.levels = {
                --   { "debug", "Comment" },
                --   { "info", "None" },
                --   { "warn", "WarningMsg" },
                --   { "error", "ErrorMsg" },
                --   { "none", "NoMsg" },
                -- }
        })
    end
}

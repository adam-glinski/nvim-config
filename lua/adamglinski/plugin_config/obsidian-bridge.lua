return {
    "oflisback/obsidian-bridge.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
    },
    event = {
        "BufReadPre *.md",
        "BufNewFile *.md",
    },
    lazy = true,
    config = function()
        require("obsidian-bridge").setup(
            {
                scroll_sync = true,
            }
        )
    end,
}

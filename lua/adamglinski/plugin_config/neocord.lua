return {
    'IogaMaster/neocord',
    event = "VeryLazy",
    config = function ()
        require("neocord").setup({
            logo = "https://i.imgur.com/c9AaALT.png",
            global_timer = true,
        })
    end
}

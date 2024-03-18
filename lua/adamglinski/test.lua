local source = '/Users/adam/Pictures/Wallpapers/macos-monterey-stock-blue-dark-mode-layers-5k-6016x6016-5895.jpg'
local buf = vim.api.nvim_get_current_buf()
local image = require('hologram.image'):new(source, {})


image:display(5, 0, buf, {})

vim.defer_fn(function()
        image:delete(0, {free=true})
    end, 5000)

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)




-- require("lazy").setup("adamglinski.plugin_config",
--     {
--     install = {
--         colorscheme =  "gruvbox-baby"
--     },
--     checker = {
--         enabled = true,
--         notify = true
--     },
--     change_detection = {
--         notify = false,
--     }
-- })



require("lazy").setup("adamglinski.plugin_config")

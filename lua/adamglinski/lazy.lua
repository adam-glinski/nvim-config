vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local ok, lazy = pcall(require, 'lazy')
if not ok then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    -- "--branch=stable", -- latest stable release | outdated
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

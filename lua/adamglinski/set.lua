require("adamglinski.env")
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.conceallevel = 2

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- FILL: Fix depending on the system
-- vim.opt.undodir = NVIM_DATA_DIR .. "/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

-- vim.cmd('language en_US.utf8')

-- C/C++ case indention fix
vim.opt.cinoptions = "0,t0,:N"
vim.opt.cinwords = "if,else,switch,case,for,while,do"
vim.opt.cindent = true

vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 99

vim.g.mapleader = " "
vim.cmd("language en_US")
vim.opt.cursorline = true

-- Vim maximizer settings
vim.api.nvim_set_var("maximizer_set_default_mapping", 0)

-- Indent blankline settings
vim.api.nvim_set_var("ibl.config.scope.show_start", false)

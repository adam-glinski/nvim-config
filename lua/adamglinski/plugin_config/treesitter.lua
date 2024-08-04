
return {
    'nvim-treesitter/nvim-treesitter',
    branch = "master", -- main branch is broken (3f38818cd49a53c9096494f14ae4c740e84659d5)
    build = ':TSUpdate',
    config = function ()
        require 'nvim-treesitter.install'.prefer_git = false
        require 'nvim-treesitter.install'.compilers = { "zig", "clang" } -- Compilers prority list
        local configs = require "nvim-treesitter.configs"

        configs.setup {
            ensure_installed = { "html" }, -- For devdocs.nvim
            sync_install = false,
            auto_install = true,
            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
            highlight = {
                enable = true,
            },
        }
    end
}

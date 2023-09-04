-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
        }
    }

    use 'nvim-telescope/telescope-symbols.nvim'

    -- Color scheme
    -- use "ellisonleao/gruvbox.nvim"
    use {
        'luisiacc/gruvbox-baby',
        branch = "main"
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        branch = "master", -- main branch is broken (3f38818cd49a53c9096494f14ae4c740e84659d5)
        run = ':TSUpdate'
    }

    use 'mbbill/undotree'

    -- Lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },     -- Required
            { 'williamboman/mason.nvim' },   -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },           -- Required
            { 'hrsh7th/cmp-nvim-lsp' },       -- Required
            { 'hrsh7th/cmp-buffer' },         -- Attemtion to fix cmp
            { 'L3MON4D3/LuaSnip' },           -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional (Added by me)
        }
    }
    use 'folke/neodev.nvim'

    -- Dap
    use 'mfussenegger/nvim-dap'
    use {
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" }
    }

    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
    }

    use 'numToStr/Comment.nvim'

    -- Org stuff
    -- use 'nvim-orgmode/orgmode'
    -- use 'akinsho/org-bullets.nvim'
    -- use 'lukas-reineke/headlines.nvim'


    -- potential breaking change in 064f8f6 
    use {
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim",
    }

    -- use 'dhruvasagar/vim-dotoo'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons'--[[ , opt = true  ]]}
    }

    use 'jghauser/mkdir.nvim'

    use {
        'stevearc/oil.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use 'rcarriga/nvim-notify'

    use 'windwp/nvim-autopairs'

    use 'lukas-reineke/indent-blankline.nvim'

    use 'ThePrimeagen/harpoon'

    use 'tpope/vim-surround'

    use {
        'ggandor/leap.nvim',
        requires = 'tpope/vim-repeat',
    }

    use 'gpanders/nvim-parinfer'

    use 'wsdjeg/vim-fetch'

    use 'lambdalisue/readablefold.vim'

    use 'kevinhwang91/nvim-bqf'

    use 'wellle/targets.vim'

    -- FIXME: Not working ://
    use {
        "Dhanus3133/LeetBuddy.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    }

    use 'nvim-focus/focus.nvim'

    use "folke/which-key.nvim"
end)



return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
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
        { 'folke/neodev.nvim' },
    },
    config = function ()
        require("neodev").setup()
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                'rust_analyzer',
                'lua_ls',
                'clangd',
            },
        })

        local lsp = require('lsp-zero')
        lsp.preset('recommended')
        -- lsp.ensure_installed({
        --     'rust_analyzer',
        --     'lua_ls',
        --     'clangd',
        -- })


        -- TODO: Customize completion mapping
        local cmp = require("cmp")
        local lspconfig = require('lspconfig')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local cmp_mappings = lsp.defaults.cmp_mappings({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            -- ['<CR>'] = cmp.mapping.confirm({select = true, behavior = cmp.ConfirmBehavior.Insert}),
            -- ['<C-y>'] = cmp.mapping.confirm({select = true, behavior = cmp.ConfirmBehavior.Insert}),
            ['<C-y>'] = cmp.mapping.confirm({select = true}),
            ['<C-Space>'] = cmp.mapping.complete(),
        })

        -- lsp.set_sign_icons({
        --     error = '✘',
        --     warn = '▲',
        --     hint = '⚑',
        --     info = '»'
        -- })

        lsp.set_sign_icons({
            error = '',
            warn = '',
            hint = '',
            info = ''
        })


        -- TODO: Document mappings
        lsp.on_attach(function(_, bufnr)
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr, remap = false, desc = "Go to definition"})
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false, desc = "Hover information"})
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {buffer = bufnr, remap = false, desc = "Goto next diagnostic"})
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {buffer = bufnr, remap = false, desc = "Goto prev diagnostic"})

            vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, remap = false, desc = "List workspace symbols"})
            vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = false, desc = "Open floating diagnostic"})
            vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false, desc = "Code action"})
            vim.keymap.set("n", "<leader>lgr", function() vim.lsp.buf.references() end, {buffer = bufnr, remap = false, desc = "List references"})
            vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = false, desc = "Rename"})
            vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({formatting_options = { tabSize = 4 }}) end, {buffer = bufnr, remap = false, desc = "Format buffer"})

            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = bufnr, remap = false, desc = "Signature help"})
            -- vim.keymap.set("i", "<C-t>", function() vim.lsp.buf.request() end, {buffer = bufnr, remap = false, desc = "Switch between source/header"})
            vim.keymap.set("i", "<C-t>", function() --[[TODO: Run my command]]  end, {buffer = bufnr, remap = false, desc = "Switch between source/header"})
        end)

        lspconfig.lua_ls.setup({})
        lspconfig.clangd.setup({
            -- --style="{BasedOnStyle: llvm, IndentWidth: 4}"
            -- cmd = {"clangd", "--fallback-style='{BasedOnStyle: LLVM, IndentWidth: 4}'"},
            cmd = {"clangd"},
            single_file_support=true,
        })
        lspconfig.cmake.setup({})


        lsp.setup()


        cmp.setup({
            formatting = lsp.cmp_format(),
            mapping = cmp_mappings,
            preselect = 'item',
            sources = {
                { name = "nvim_lsp" },
                { name = "orgmode" },
                { name = "buffer" },
                -- { name = "clangd" },
                -- { name = "" },
            completion = {
                completeopt = 'menu,menuone,noinsert'
            }
            },

        })
    end

}

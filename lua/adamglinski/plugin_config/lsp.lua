return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
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

        local lsp = require('lsp-zero')
        lsp.preset('recommended')
        lsp.ensure_installed({
            'rust_analyzer',
            'lua_ls',
            'clangd',
        })


        -- TODO: Customize completion mapping
        local cmp = require("cmp")
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local cmp_mappings = lsp.defaults.cmp_mappings({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-^@>'] = cmp.mapping.confirm({select = true}),
            ['<C-Space>'] = cmp.mapping.complete(),
        })


        lsp.setup_nvim_cmp({
            mapping = cmp_mappings
        })
        --[[
        lsp.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })
        --]]

        lsp.set_sign_icons({
            error = '',
            warn = '',
            hint = '',
            info = ''
        })


        -- TODO: Document mappings
        lsp.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr, remap = false, desc = "Go to definition"})
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false, desc = "Hover information"})
            vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, remap = false, desc = "List workspace symbols"})
            vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = false, desc = "Open floating diagnostic"})
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {buffer = bufnr, remap = false, desc = "Goto next diagnostic"})
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {buffer = bufnr, remap = false, desc = "Goto prev diagnostic"})
            vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false, desc = "Code action"})
            vim.keymap.set("n", "<leader>lgr", function() vim.lsp.buf.references() end, {buffer = bufnr, remap = false, desc = "List references"})
            vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = false, desc = "Rename"})
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = bufnr, remap = false, desc = "Signature help"})
            vim.keymap.set("i", "<C-t>", function() vim.lsp.buf.request() end, {buffer = bufnr, remap = false, desc = "Switch between source/header"})
        end)

        require('lspconfig').lua_ls.setup({})

        lsp.setup()


        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "orgmode" },
                { name = "buffer" },
            }
        })
    end

}

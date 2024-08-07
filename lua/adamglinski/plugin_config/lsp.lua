local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

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
        { 'hrsh7th/cmp-buffer' },         -- Optional
        { 'hrsh7th/cmp-path' },         -- Optional
        { 'hrsh7th/cmp-cmdline' },         -- Optional
        { 'L3MON4D3/LuaSnip' },           -- Required
        { 'rafamadriz/friendly-snippets' }, -- Optional (Added by me)
        { 'folke/neodev.nvim' },
    },
    config = function ()
        local lsp = require('lsp-zero')
        local lspconfig = require('lspconfig')
        require("neodev").setup()
        require("mason").setup({})
        require("mason-lspconfig").setup({
            handlers = {
                function (server_name)
                    lspconfig[server_name].setup({}) -- Automatic lsp server setup
                end,
                clangd = function ()
                    -- local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
                    -- local filetype = vim.api.nvim_get_option_value("filetype", {buf = bufnr});
                    lspconfig.clangd.setup({
                        cmd = {"clangd"},
                        single_file_support=true,
                        -- cmd = {"clangd", "--fallback-style='{BasedOnStyle: LLVM, IndentWidth: 4}'"},
                    })
                end
            },
            ensure_installed = {
                'lua_ls',
            },
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

        lsp.on_attach(function(client, bufnr)
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr, remap = false, desc = "Go to definition"})
            vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, {buffer = bufnr, remap = false, desc = "Go to declaration"})
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false, desc = "Hover information"})
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {buffer = bufnr, remap = false, desc = "Goto next diagnostic"})
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {buffer = bufnr, remap = false, desc = "Goto prev diagnostic"})

            vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = false, desc = "Open floating diagnostic"})
            vim.keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics<cr>", {buffer = bufnr, remap = false, desc = "Open floating diagnostic"})
            vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false, desc = "Code action"})
            vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.references() end, {buffer = bufnr, remap = false, desc = "List references"})
            vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = false, desc = "Rename"})
            vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({formatting_options = { tabSize = 4 }}) end, {buffer = bufnr, remap = false, desc = "Format buffer"})

            vim.keymap.set({"i", "n"}, "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = bufnr, remap = false, desc = "Signature help"})
            vim.keymap.set("n", "<leader>li", function () vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({})) end, {remap = false, desc = "Inlay hints"})
            if client.name == "clangd" then
                vim.keymap.set({"i", "n"}, "<C-t>", "<cmd>ClangdSwitchSourceHeader<cr>", {buffer = bufnr, remap = false, desc = "Switch between source/header"})
            end
        end)

        local cmp = require("cmp")
        local cmp_action = require("lsp-zero").cmp_action()
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        cmp.setup.cmdline({'/', '?'}, {
            mapping = cmp.mapping.preset.cmdline(),
            view = {
                entries = {name = 'wildmenu', separator = '|' },
            },
            sources = {
                { name = "buffer" }
            }
        })
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            view = {
                entries = {name = 'wildmenu', separator = '|' },
            },
            sources = {
                {name = 'path'},
                { name = 'cmdline' },
            },
            matching = { disallow_symbol_nonprefix_matching = false }
        })
        cmp.setup({
            mapping = {
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                -- ['<CR>'] = cmp.mapping.confirm({select = true}),
                ['<C-y>'] = cmp.mapping.confirm({select = true}),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            },
            snippet = {
                expand = function (args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
            formatting = {
                format = function (_, vim_item)
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                    return vim_item
                end,
                expandable_indicator = true,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
                -- { name = "orgmode" },
            },
        })
    end
}

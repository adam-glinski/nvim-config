return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets', "nvim-tree/nvim-web-devicons", "onsails/lspkind.nvim" },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'default' },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono',
        },

        -- completion = {
        --     documentation = { auto_show = true, auto_show_delay_ms = 500 },
        --     ghost_text = { enabled = true },
        --     menu = {
        --         draw = {
        --             treesitter = {"lsp"},
        --             -- We don't need label_description now because label and label_description are already
        --             -- combined together in label by colorful-menu.nvim.
        --             columns = { { "kind_icon" }, { "label", gap = 1 } },
        --             components = {
        --                 label = {
        --                     text = function(ctx)
        --                         return require("colorful-menu").blink_components_text(ctx)
        --                     end,
        --                     highlight = function(ctx)
        --                         return require("colorful-menu").blink_components_highlight(ctx)
        --                     end,
        --                     kind_icon =
        --                 }
        --             },
        --         }
        --     }
        -- },
        --
        completion = {
            list = {
                selection = {
                    preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
                    -- auto_insert = function(ctx) return ctx.mode ~= 'cmdline' end
                    auto_insert = false
                }
            },
            menu = {
                min_width = 18,
                -- winblend = 10,
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label",  "source_name", gap = 1 },
                    },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                        kind_icon = {
                            text = function(ctx)
                                if ctx.source_id == "cmdline" then return end
                                local icon = ctx.kind_icon
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        icon = dev_icon
                                    end
                                else
                                    icon = require("lspkind").symbolic(ctx.kind, {
                                        mode = "symbol",
                                    })
                                end

                                return icon .. ctx.icon_gap
                                -- return ctx.kind_icon .. ctx.icon_gap
                            end,
                            highlight = function(ctx)
                                local hl = ctx.kind_hl
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        hl = dev_hl
                                    end
                                end
                                return hl
                            end,
                        },
                        source_name = {
                            text = function(ctx)
                                if ctx.source_id == "cmdline" then return end
                                return ctx.source_name:sub(1, 4)
                            end
                        },
                    },
                    -- treesitter = {"lsp"} -- using colorful-menu
                },
            },
            documentation = {
                auto_show = true,
                window = {
                    winblend = 10
                }
            },
            ghost_text = {
                enabled = true,
            }
        },
        signature = {
            enabled = true,
            window = {
                scrollbar = false,
                winblend = 10,
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" },
            signature = { enabled = true }
        }
    },
    opts_extend = { "sources.default" }
}

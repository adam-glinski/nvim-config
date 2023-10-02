-- 'nvim-telescope/telescope-symbols.nvim'
return {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
            'nvim-tree/nvim-web-devicons',
            'nvim-telescope/telescope-symbols.nvim',
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find file" })
                vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Find word" })
                vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = "Find word under cursor" })
                vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Find recent" })

                telescope.setup{
                    defaults = {
                        borderchars = {
                            prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                            results = { " " },
                            preview = { " " },
                        },
                        layout_strategy = 'horizontal',
                        layout_config = {
                            height = 0.95,
                            prompt_position = "top",
                        },
                        sorting_strategy = "ascending"
                    }
                }

            telescope.load_extension("fzf")
        end
}

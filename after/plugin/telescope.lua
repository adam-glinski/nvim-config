local telescope = require("telescope")

local builtin = require('telescope.builtin')

-- builtin.buffers({
--     entry_maker = require("adamglinski.rc.telescope.my_make_entry").gen_from_buffer_like_leaderf(),
-- })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find file" })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Find word" })
vim.keymap.set('n', '<leader>fg', builtin.git_status, { desc = "Find git" })

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

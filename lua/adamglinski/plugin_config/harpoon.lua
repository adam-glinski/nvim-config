return {
    'ThePrimeagen/harpoon',
    config = function ()
        require("harpoon").setup({})
        require("telescope").load_extension("harpoon")

        vim.keymap.set("n", "<leader>ha", function() require("harpoon.mark").add_file() end, { desc = "Mark file with harpoon." })
        vim.keymap.set("n", "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle harpoon menu." })

        -- Switch to specific file
        vim.keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end, { desc = "Naviget to file nr 1 with harpoon." })
        vim.keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end, { desc = "Naviget to file nr 2 with harpoon." })
        vim.keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end, { desc = "Naviget to file nr 3 with harpoon." })
        vim.keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end, { desc = "Naviget to file nr 4 with harpoon." })
        vim.keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end, { desc = "Naviget to file nr 5 with harpoon." })
        vim.keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end, { desc = "Naviget to file nr 6 with harpoon." })
        vim.keymap.set("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end, { desc = "Naviget to file nr 7 with harpoon." })
        vim.keymap.set("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end, { desc = "Naviget to file nr 8 with harpoon." })
        vim.keymap.set("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end, { desc = "Naviget to file nr 9 with harpoon." })
        vim.keymap.set("n", "<leader>h0", function() require("harpoon.ui").nav_file(0) end, { desc = "Naviget to file nr 0 with harpoon." })


        vim.keymap.set("n", "<leader>hn", function() require("harpoon.ui").nav_next() end, { desc = "Naviget to next file with harpoon." })
        vim.keymap.set("n", "<leader>hp", function() require("harpoon.ui").nav_prev() end, { desc = "Naviget to prev file with harpoon." })
    end
}

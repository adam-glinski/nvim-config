
return {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function ()
        require("toggleterm").setup{
            -- shell = "pwsh.exe -NoLogo",
        }

        -- Windows new powershell
        -- Prob junk but if I remove this and break something aint fixing it again
        -- vim.cmd("set shell=pwsh.exe")
        -- vim.cmd("set shellxquote=")
        -- vim.cmd("let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '")
        -- vim.cmd("let &shellquote   = ''")
        -- vim.cmd("let &shellpipe    = '| Out-File -Encoding UTF8 %s'")
        -- vim.cmd("let &shellredir   = '| Out-File -Encoding UTF8 %s'")

        -- FIXME: Remove useless params
        function ToggleTermInCWD(direction, size, shell)
            shell = shell or vim.o.shell --"powershell" -- NOTE: Default shell
            if size then
                return "<cmd>ToggleTerm size=".. size .." dir=\"".. vim.fn.getcwd() .."\" direction=".. direction .. "<CR>"--" shell=".. shell .."<CR>"
            else
                return "<cmd>ToggleTerm dir=\"".. vim.fn.getcwd() .."\" direction=".. direction .. "<CR>"--" shell=".. shell .."<CR>"
            end
        end

        vim.keymap.set('n', '<leader>tv', ToggleTermInCWD("vertical", 60), { desc = "Vertical terminal" })
        vim.keymap.set('n', '<leader>th', ToggleTermInCWD("horizontal", 12), { desc = "Horizontal terminal" })
        vim.keymap.set('n', '<leader>tf', ToggleTermInCWD("float"), { desc = "Floating terminal" })
        vim.keymap.set('n', '<leader>tt', ToggleTermInCWD("tab"), { desc = "Tab terminal" })

        -- Lazygit term
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = false,
            direction = "float",
        })

        -- TODO: bind it
        -- function LazygitToggle()
        --     lazygit:toggle()
        -- end

        vim.keymap.set('n', '<leader>tg', function() lazygit:toggle() end, { desc = "Lazygit" })

        -- Terminal mappings
        function SetTerminalKeymaps()
            local opts = {buffer = 0}
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end
        vim.cmd('autocmd! TermOpen term://* lua SetTerminalKeymaps()')
    end
}

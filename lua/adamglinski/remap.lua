require("adamglinski.env")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Replace without yanking" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to sys clip" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to sys clip" })

vim.keymap.set({ "n", "v" }, "<leader>x", [["_d]], { desc = "Delete without yanking" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- Disabled since on windows...
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev location" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace all occurrences" })
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- Disabled since on windows...

-- TODO: Think of a better keymap
vim.keymap.set("n", "<leader>ep", "<cmd>e " .. NVIM_DIR .. "\\lua\\adamglinski\\plugin.lua<CR>",
    { desc = "Edit plugin file" })
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Window zoom
-- local isWindowZoomed = false
--     vim.keymap.set("n", "<C-w>z", function ()
--         isWindowZoomed = not isWindowZoomed
--         if isWindowZoomed then
--             print("Zoomin in")
--             return "<C-w>_ \\| <C-w>|"
--         else
--             print("Zoomin out")
--             return '<C-w> ='
--         end
--     end)
-- vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source file" })
vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue <cr>", { desc = "Start or continue debugging" })

-- Nvim-spider remaps
vim.keymap.set(
	{ "n", "o", "x" },
	"w",
	"<cmd>lua require('spider').motion('w')<CR>",
	{ desc = "Next word(spider)" }
)
vim.keymap.set(
	{ "n", "o", "x" },
	"e",
	"<cmd>lua require('spider').motion('e')<CR>",
	{ desc = "Next end of word(spider)" }
)
vim.keymap.set(
	{ "n", "o", "x" },
	"b",
	"<cmd>lua require('spider').motion('b')<CR>",
	{ desc = "Previous word(spider)" }
)

-- Neogit mappings
vim.keymap.set("n", "<leader>gg", function () require("neogit").open({ kind = "auto" }) end, { desc = "Open neogit" })
vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gH", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo Stage hunk" })

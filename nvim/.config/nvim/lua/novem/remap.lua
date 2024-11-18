vim.g.mapleader = " "

-- Enter extended mode
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move marked text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Ctrl-a L
--vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format using language server rules
vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format()
end)

-- Split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<leader>c", ":close<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", { noremap = true })
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]],
        { noremap = true, silent = true, desc = "Exit terminal mode and enter normal mode" })

-- Diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { noremap = true })

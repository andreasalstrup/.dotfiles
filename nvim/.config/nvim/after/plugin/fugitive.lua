-- [g]it [s]tatus
vim.keymap.set("n", "<leader>gs", ":vert Git<CR>", { desc = 'Git status' })

-- [g]it [d]iff split
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit!<CR>", { noremap = true, silent = true, desc = 'Diff split 3 way' })

-- [g]it [s]tatus
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- [g]it [d]iff split
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit!<CR>", {noremap = true, silent = true })

-- :Gitsigns stage_hunk
-- vim.keymap.set("n", "<:leader>gh"

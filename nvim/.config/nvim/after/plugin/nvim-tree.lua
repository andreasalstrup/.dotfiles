require('nvim-tree').setup({
        hijack_cursor = true,
        view = {
                width = 40
        },
        diagnostics = {
                enable = true,
        }
})

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>',
        { noremap = true, silent = true, desc = "Open nvim-tree" }
)

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup({
        defaults = {
        },
        pickers = {
                buffers = {
                        mappings = {
                                i = {
                                        ['<C-d>'] = actions.delete_buffer,
                                },
                                n = {
                                        ['<C-d>'] = actions.delete_buffer,
                                },
                        },
                },
        },
})

-- project find
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files in git only' })
vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>o', builtin.buffers, { desc = 'Buffers' })

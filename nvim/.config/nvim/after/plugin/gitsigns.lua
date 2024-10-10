require('gitsigns').setup({
        on_attach = function(bufnr)
                local gitsigns = require('gitsigns')
                
                -- Keep default setup
                local function map(mode, lhs, rhs, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, lhs, rhs, opts)
                end

                map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
                map('n', '<leader>hd', gitsigns.diffthis)
                map('n', '<leader>hp', gitsigns.preview_hunk)
                map('n', '<leader>td', gitsigns.toggle_deleted)
        end
})


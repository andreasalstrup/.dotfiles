require('lualine').setup({
        sections = {
                lualine_a = {},
                -- lualine_b = {},
                lualine_c = {
                        { 'filename',     path = 1,        color = 'normal' },
                        { 'lsp_progress', color = 'normal' },
                },
                lualine_x = {},
                -- lualine_y = {},
                lualine_z = {},
        }
})

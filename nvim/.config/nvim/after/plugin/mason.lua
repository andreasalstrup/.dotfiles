require('mason').setup({})
require('mason-lspconfig').setup({
        ensure_installed = {
                'lua_ls',
                'clangd',
                'rust_analyzer',
                'eslint',
                'ts_ls',
                'pyright',
                'gopls',
        },
        handlers = {
                function(server_name)
                        require('lspconfig')[server_name].setup({})
                end,
        }
})

require('lspconfig').lua_ls.setup({
        settings = {
                Lua = {
                        diagnostics = {
                                globals = { 'vim' }
                        }
                }
        }
})

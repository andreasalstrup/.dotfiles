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

                clangd = function()
                        require('lspconfig').clangd.setup({
                                cmd = {
                                        "clangd",
                                        "--clang-tidy=false", -- dont want double diagnostics
                                        "--fallback-style=LLVM",
                                },
                        })
                end,

                lua_ls = function()
                        require('lspconfig').lua_ls.setup({
                                settings = {
                                        Lua = {
                                                diagnostics = {
                                                        globals = { 'vim' },
                                                },
                                        },
                                },
                        })
                end,
        }
})

vim.api.nvim_create_user_command('MasonUpdateAll', function()
        require('mason.api.command').MasonUpdate()
end, {})

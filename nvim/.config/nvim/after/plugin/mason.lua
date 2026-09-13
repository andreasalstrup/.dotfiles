local is_nixos = vim.uv.fs_stat('/etc/NIXOS') ~= nil;
if is_nixos then
        return
end

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
                'nil_ls',
        },
        automatic_enable = true
        -- handlers = {
        --         function(server_name)
        --                 require('lspconfig')[server_name].setup({})
        --         end,
        -- }
})

vim.api.nvim_create_user_command('MasonUpdateAll', function()
        require('mason.api.command').MasonUpdate()
end, {})

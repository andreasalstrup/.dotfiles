---
-- LSP configuration
---
local lsp = require('lsp-zero')

local lsp_attach = function(client, bufnr)
        local opts = { buffer = bufnr }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>',
                vim.tbl_extend("force", opts, { desc = "Show Hover Information" }))

        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>',
                vim.tbl_extend("force", opts, { desc = "Go to Definition" }))

        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>',
                vim.tbl_extend("force", opts, { desc = "Go to Declaration" }))

        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
                vim.tbl_extend("force", opts, { desc = "Go to Implementation" }))

        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
                vim.tbl_extend("force", opts, { desc = "Go to Type Definition" }))

        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>',
                vim.tbl_extend("force", opts, { desc = "Find References" }))

        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
                vim.tbl_extend("force", opts, { desc = "Show Signature Help" }))

        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>',
                vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))

        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
                vim.tbl_extend("force", opts, { desc = "Format Code" }))

        vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>',
                vim.tbl_extend("force", opts, { desc = "Show Code Actions" }))
end

lsp.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

---
-- Autocompletion setup
---
local cmp = require('cmp')

cmp.setup({
        sources = {
                { name = 'nvim_lsp' },
        },
        snippet = {
                expand = function(args)
                        -- You need Neovim v0.10 to use vim.snippet
                        vim.snippet.expand(args.body)
                end,
        },
        mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_next_item()
                        else
                                fallback()
                        end
                end, { 'c', 's', 'i' }),

                ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_prev_item()
                        else
                                fallback()
                        end
                end, { 'c', 's', 'i' }),

                ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
})

lsp.configure('lua_ls', {
        settings = {
                Lua = {
                        diagnostics = {
                                globals = { 'vim' },
                        },
                        workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                        },
                },
        },
})

lsp.setup()

vim.diagnostic.config({
        virtual_text = true,
        update_in_insert = true,
})

require('mason-nvim-dap').setup({
        ensure_installed = {
                'codelldb',             -- c, c++, rust
                'delve',                -- go
                'debugpy',              -- python
                'js-debug-adapter',     -- javascript/typescript
                'chrome-debug-adapter', -- browser js
        },
        automatic_installation = true,
        handlers = {},
})

-- :help dap-mapping
-- :help dap-api
-- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
-- -DCMAKE_BUILD_TYPE=Debug
local dap = require('dap')
dap.adapters.codelldb = {
        type = "executable",
        command = vim.fn.expand("~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"),

        -- On windows you may have to uncomment this:
        -- detached = false,
}

dap.configurations.cpp = {
        {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
        },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Control
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<Down>", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<Right>", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<Left>", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<Up>", function()
        if dap.restart_frame then
                dap.restart_frame()
        else
                print("Restart frame not supported for this adapter")
        end
end, { desc = "Restart Frame" })
vim.keymap.set('n', '<Leader>dq', function()
        dap.terminate()
        dap.repl.close()
        dap.disconnect() -- optional
end, { desc = "Terminate & Cleanup Debug Session" })

-- UI
vim.keymap.set('n', '<Leader>dr', dap.repl.open, { desc = "Open DAP REPL" })
vim.keymap.set('n', '<Leader>dl', dap.run_last, { desc = "Run Last Debug Session" })
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
        require('dap.ui.widgets').hover()
end, { desc = "Hover Inspect Variable" })

vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
end, { desc = "Preview Expression" })

vim.keymap.set('n', '<Leader>df', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
end, { desc = "Show Call Stack (Frames)" })

vim.keymap.set('n', '<Leader>ds', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
end, { desc = "Show Variable Scopes" })

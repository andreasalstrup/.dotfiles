vim.api.nvim_create_autocmd('PackChanged', {
    group = vim.api.nvim_create_augroup('novem-pack-build', { clear = true }),
    callback = function(ev)
        if ev.data.kind == 'delete' then return end
        if ev.data.spec.name == 'nvim-treesitter' then vim.cmd('TSUpdate') end
    end,
})

vim.pack.add({
    { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },

    'https://github.com/nvim-lua/plenary.nvim',
    { src = 'https://github.com/nvim-telescope/telescope.nvim', version = '0.1.8' },

    'https://github.com/nvim-mini/mini.nvim',
    'https://github.com/mbbill/undotree',
    'https://github.com/christoomey/vim-tmux-navigator',
    'https://github.com/folke/which-key.nvim',
    'https://github.com/folke/trouble.nvim',
    'https://github.com/akinsho/toggleterm.nvim',

    'https://github.com/tpope/vim-fugitive',
    'https://github.com/lewis6991/gitsigns.nvim',

    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/kyazdani42/nvim-tree.lua',
    'https://github.com/arkav/lualine-lsp-progress',
    'https://github.com/nvim-lualine/lualine.nvim',

    -- 'https://github.com/williamboman/mason.nvim',
    -- 'https://github.com/williamboman/mason-lspconfig.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/cmp-nvim-lua',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/saadparwaiz1/cmp_luasnip',
    'https://github.com/rafamadriz/friendly-snippets',

    'https://github.com/mfussenegger/nvim-dap',
    -- 'https://github.com/jay-babu/mason-nvim-dap.nvim',
})

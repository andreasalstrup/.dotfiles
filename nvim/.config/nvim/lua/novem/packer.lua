-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        use {
                'nvim-telescope/telescope.nvim', tag = '0.1.8',
                -- or                            , branch = '0.1.x',
                requires = { { 'nvim-lua/plenary.nvim' } }
        }

        use({
                "rose-pine/neovim",
                as = "rose-pine",
                config = function()
                        vim.cmd('colorscheme rose-pine')
                end
        })

        use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
        use('mbbill/undotree')
        use('tpope/vim-fugitive')
        use('lewis6991/gitsigns.nvim')
        use('folke/which-key.nvim')
        use('christoomey/vim-tmux-navigator')

        use({
                'folke/trouble.nvim',
                config = function()
                        require("trouble").setup {
                        }
                end
        })

        use({
                'numToStr/Comment.nvim',
                config = function()
                        require('Comment').setup()
                end
        })

        use { "akinsho/toggleterm.nvim", tag = '*', config = function()
                require("toggleterm").setup()
        end }

        use {
                'kyazdani42/nvim-tree.lua',
                requires = { { 'nvim-tree/nvim-web-devicons' } }
        }

        use {
                'nvim-lualine/lualine.nvim',
                requires = {
                        { 'nvim-tree/nvim-web-devicons', opt = true },
                        { 'arkav/lualine-lsp-progress' }
                }
        }

        -- lsp-zero
        --use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
        --use({'neovim/nvim-lspconfig'})
        --use({'hrsh7th/nvim-cmp'})
        --use({'hrsh7th/cmp-nvim-lsp'})

        use {
                'VonHeikemen/lsp-zero.nvim', branch = 'v4.x',
                requires = {
                        -- LSP Support
                        { 'neovim/nvim-lspconfig' },
                        { 'williamboman/mason.nvim' },
                        { 'williamboman/mason-lspconfig.nvim' },

                        -- Autocompletion
                        { 'hrsh7th/nvim-cmp' },
                        { 'hrsh7th/cmp-buffer' },
                        { 'hrsh7th/cmp-path' },
                        { 'saadparwaiz1/cmp_luasnip' },
                        { 'hrsh7th/cmp-nvim-lsp' },
                        { 'hrsh7th/cmp-nvim-lua' },

                        -- Snippets
                        { 'L3MON4D3/LuaSnip' },
                        { 'rafamadriz/friendly-snippets' },
                }
        }
end);

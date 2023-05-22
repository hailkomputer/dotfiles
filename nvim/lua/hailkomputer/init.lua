require("hailkomputer.set")
require("hailkomputer.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 
        'rose-pine/neovim', 
        name = 'rose-pine',
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function ()
            vim.cmd.colorscheme 'rose-pine'
        end, 
    },
    { 
        'mbbill/undotree',
    },
    { 
        'nvim-treesitter/nvim-treesitter', 
        build = ':TSUpdate',
    },
    { 
        'theprimeagen/harpoon',
    },
    { 
        'tpope/vim-fugitive',
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
            'williamboman/mason.nvim',
            build = function()
              pcall(vim.cmd, 'MasonUpdate')
            end,
          },
          {'williamboman/mason-lspconfig.nvim'}, -- Optional
      
          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
        }
      }
})
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-lualine/lualine.nvim'
  use {
      'nvim-treesitter/nvim-treesitter',
      -- run = ':TSUpdate'
  }
  use 'mattn/emmet-vim'
  use {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
	  "williamboman/mason.nvim",
  	"williamboman/mason-lspconfig.nvim",
  	"neovim/nvim-lspconfig",
  }
  use {
   'hrsh7th/cmp-nvim-lsp',
   'hrsh7th/cmp-buffer',
   'hrsh7th/cmp-path',
   'hrsh7th/cmp-cmdline',
   'hrsh7th/nvim-cmp',
   'saadparwaiz1/cmp_luasnip',        -- Snippet completion source
   'L3MON4D3/LuaSnip',                -- Snippet engine
   'windwp/nvim-autopairs',
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use 'goolord/alpha-nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

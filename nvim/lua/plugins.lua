local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)

use 'lewis6991/impatient.nvim'
use 'NLKNguyen/papercolor-theme'
use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
use 'tpope/vim-surround'
use 'ggandor/lightspeed.nvim'
use 'lukas-reineke/indent-blankline.nvim'
use 'ntpeters/vim-better-whitespace'
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'neovim/nvim-lspconfig'
use 'williamboman/nvim-lsp-installer'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

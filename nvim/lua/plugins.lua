local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)

	-- Makes plugins load faster by caching stuff
	use 'lewis6991/impatient.nvim'

	-- The actual plugin manager
	use 'wbthomason/packer.nvim'

	-- Vim theme
	use 'NLKNguyen/papercolor-theme'

	-- Code syntax reading to provide functionality to all other things
	use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
		}

	use 'tpope/vim-surround'

	-- For giga fast navigating
	use 'ggandor/lightspeed.nvim'

	-- Add indent lines
	use 'lukas-reineke/indent-blankline.nvim'

	-- Highlight trailing whitespaces
	use 'ntpeters/vim-better-whitespace'

	-- Grep project root and search files
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'

	-- Language server to provide syntax checking
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'

	if packer_bootstrap then
		require('packer').sync()
	end
end)

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)

	-- The actual plugin manager
	use 'wbthomason/packer.nvim'

	-- Vim theme
	--use 'NLKNguyen/papercolor-theme'
	use 'catppuccin/nvim'

	-- Code syntax reading to provide functionality to all other things
	use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
		}

	use 'tpope/vim-surround'

	-- Statusbar
	use 'feline-nvim/feline.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use {
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig"
	}
	use {'lewis6991/gitsigns.nvim'}

	-- For giga fast navigating
	use 'ggandor/lightspeed.nvim'

	-- Add indent lines
	use 'lukas-reineke/indent-blankline.nvim'

	-- Highlight trailing whitespaces
	use 'ntpeters/vim-better-whitespace'

	-- Auto pair everything
	use 'windwp/nvim-autopairs'

	-- Highlight current hovered variable like in vscode
	use 'RRethy/vim-illuminate'

	-- Grep project root and search files
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'

	-- Language server to provide syntax checking
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	-- Autocompletion and stuff
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- For ultisnips users.
	use 'SirVer/ultisnips'
	use 'honza/vim-snippets'
	use 'quangnguyen30192/cmp-nvim-ultisnips'

	-- For toggle commenting blocks of code
	use 'numToStr/Comment.nvim'

	if packer_bootstrap then
		require('packer').sync()
	end
end)

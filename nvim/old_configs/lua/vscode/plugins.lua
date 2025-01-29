local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)

	-- The actual plugin manager
	use 'wbthomason/packer.nvim'
	--
	use 'tpope/vim-surround'

	-- For giga fast navigating
	use 'ggandor/lightspeed.nvim'

	-- Auto pair everything
	use 'windwp/nvim-autopairs'

	if packer_bootstrap then
		require('packer').sync()
	end
end)

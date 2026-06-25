local plugins_common = {
  	"https://codeberg.org/andyg/leap.nvim",
}

local plugins_nvim = {
	"https://github.com/tpope/vim-surround",
  	"https://github.com/RRethy/vim-illuminate",
  	"https://github.com/NLKNguyen/papercolor-theme",
  	"https://github.com/ntpeters/vim-better-whitespace",
  	"https://github.com/windwp/nvim-autopairs",
  	"https://github.com/numToStr/Comment.nvim",
  	"https://github.com/lukas-reineke/indent-blankline.nvim",
  	"https://github.com/nvim-treesitter/nvim-treesitter",
  	"https://github.com/nvim-lua/plenary.nvim",
  	"https://github.com/nvim-telescope/telescope.nvim",
}
local plugins_vscode = {
}

vim.pack.add(plugins_common)
require("plugins.config.common")

if not vim.g.vscode then
	vim.pack.add(plugins_nvim)
	require("plugins.config.nvim")
end

if vim.g.vscode then
	vim.pack.add(plugins_vscode)
	require("plugins.config.vscode")
end


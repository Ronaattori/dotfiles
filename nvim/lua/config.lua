-- Load plugins
require("plugins.plugins")

local opts = {
	shiftwidth = 4,
	tabstop = 4,
	wrap = false,
	termguicolors = true,
	number = true,
	relativenumber = true,
	-- Auto indenting new lines and copy the style (tab vs space) from the line above
	autoindent = true,
	smartindent = true,
	copyindent = true,
}

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.o.autocomplete = true

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- Set other options
if not vim.g.vscode then
	vim.cmd.colorscheme("PaperColor")
end

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	signs = true,
})


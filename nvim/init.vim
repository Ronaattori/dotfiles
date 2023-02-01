set number
syntax on
set tabstop=4
set shiftwidth=4
set nocompatible
set pumheight=8
set termguicolors

if exists('g:vscode')
    " VSCode extension
	" Loads plugins from ./lua/vscode/<file>
	lua require('vscode/plugins')
	lua require('vscode/config')
else
	" ordinary Neovim
	" Loads plugins from ./lua/nvim/<file>
	lua require('impatient')

	lua require('nvim/plugins')

	lua require('nvim/felineConfig')
	lua require('nvim/telescopeConfig')
	lua require('nvim/config')
	lua require('nvim/cmpConfig')

	colorscheme PaperColor

	" \sw to clear whitespaces in file
	nnoremap <leader>sw <cmd>:StripWhitespace<cr>

	nnoremap <leader>ff <cmd>Telescope find_files<cr>
	nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif

" Remap :W to :w cause releasing shift is hard 8DDDD
cnoremap W w

set completeopt=menu,menuone,noselect

set t_Co=256
set background=dark
set laststatus=2


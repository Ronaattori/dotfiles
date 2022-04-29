set number
syntax on
set tabstop=4
set shiftwidth=4
set nocompatible
set pumheight=8

lua require('plugins')

lua require('impatient')

" Set up keybinds

" \sw to clear whitespaces in file
nnoremap <leader>sw <cmd>:StripWhitespace<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Remap :W to :w cause releasing shift is hard 8DDDD
cnoremap W w


set completeopt=menu,menuone,noselect

set t_Co=256
set background=dark
colorscheme PaperColor
set laststatus=2

" Load lua config from ~/.config/nvim/lua/cmpConfig.lua
" lua require('cmpConfig')

" Load lua config from ~/.config/nvim/lua/telescopeConfig.lua
lua require('telescopeConfig')
"
" Load lua config from ~/.config/nvim/lua/config.lua
lua require('config')

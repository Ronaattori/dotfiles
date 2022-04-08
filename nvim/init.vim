set number
syntax on
set tabstop=4
set shiftwidth=4
set nocompatible
set pumheight=8


if empty(glob('~/.config/nvim/plug.vim'))
  silent !curl -fLo ~/.config/nvim/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plug')

" Themes
Plug 'NLKNguyen/papercolor-theme'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tpope/vim-surround'

Plug 'ggandor/lightspeed.nvim'

" Add indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'

" Debugger
" Plug 'puremourning/vimspector'

" Interactively run parts of code
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
" Plug 'hkupty/iron.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" Set up keybinds

nmap <leader>f <Plug>SnipRun
vmap f <Plug>SnipRun

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


set completeopt=menu,menuone,noselect

set t_Co=256
set background=dark
colorscheme PaperColor
set laststatus=2

" Load lua config from ~/.config/nvim/lua/cmpConfig.lua
lua require('cmpConfig')

" Load lua config from ~/.config/nvim/lua/telescopeConfig.lua
lua require('telescopeConfig')
"
" Load lua config from ~/.config/nvim/lua/config.lua
lua require('config')

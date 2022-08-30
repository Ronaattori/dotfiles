require'nvim-treesitter.configs'.setup {

	-- Auto install listed parsers
	ensure_installed = {
		"python",
		"javascript",
		"php",
		"lua",
		"json",
		"dockerfile",
		"css",
		"scss",
		"regex",
		"rasi",
		"yaml",
		"vim"
		},

	-- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = false,

	indent = {
		enable = true
	},
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
  	},
}

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

require('nvim-autopairs').setup{
	check_ts = true,
}

require('Comment').setup{
	mappings = {
		basic = true,
		extra = false,
		extended = false,
	},
	opleader = {
		line = "<C-'>", -- Same as the VsCode bind for toggling comments
	}
}

-- Language server installer
require("mason").setup()
require("mason-lspconfig").setup()
-- Setup all LSP servers
-- Refer to https://github.com/neovim/nvim-lspconfig for passing parameters to the servers
local on_attach = function(client, bufnr)
	local options = { noremap=true, silent=true }
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end
local lsp_servers = require("mason-lspconfig").get_installed_servers()
for key, value in pairs(lsp_servers) do
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

	require('lspconfig')[value].setup{
		capabilities = capabilities,
		on_attach = on_attach,
	};
end


-- LSP error message styling
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})



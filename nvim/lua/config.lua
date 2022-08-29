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

-- Language server installer
require("mason").setup()
require("mason-lspconfig").setup()
-- Setup all LSP servers
-- Refer to https://github.com/neovim/nvim-lspconfig for passing parameters to the servers
local lsp_servers = require("mason-lspconfig").get_installed_servers()
for key, value in pairs(lsp_servers) do
	require('lspconfig')[value].setup{};
end
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
-- 
--     -- (optional) Customize the options passed to the server
--     -- if server.name == "tsserver" then
--     --     opts.root_dir = function() ... end
--     -- end
-- 	opts.on_attach = function(client, bufnr)
-- 		  local options = { noremap=true, silent=true }
-- 		  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
-- 
-- 		  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
-- 		  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
-- 		  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
-- 		  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
-- 		  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
-- 		  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', options)
-- 	end
-- 
-- 	opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- 
--     -- This setup() function will take the provided server configuration and decorate it with the necessary properties
--     -- before passing it onwards to lspconfig.
--     -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--     server:setup(opts)
-- end)

-- LSP error message styling
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})



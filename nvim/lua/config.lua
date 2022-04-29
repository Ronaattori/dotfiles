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

-- Language server installer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- LSP error message styling
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- How to display sniprun result
require("sniprun").setup({
    display = {"TempFloatingWindow"},
})

-- Jump around snippets with tab
-- vim.g.UltiSnipsExpandTrigger="<S-CR>"
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
vim.g.UltiSnipsJumpBackwardTrigger="<S-tab>"

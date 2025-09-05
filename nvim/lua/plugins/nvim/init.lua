return {
	"NLKNguyen/papercolor-theme",
	"ntpeters/vim-better-whitespace",
	"RRethy/vim-illuminate",

    -- Auto pair quotes and stuff
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
    },

    {
        "numToStr/Comment.nvim",
        opts = {
            opleader = {
                -- Vscode is <C-'> but that doesn't work here for some reason
                line = "<C-p>",
            }
        }
    },

    -- Add lines to indicate indentations
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = true,
    },

	{
		"nvim-treesitter/nvim-treesitter",
        opts = {
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
            indent = { enable = true },
            highlight = { enable = true },
        }
	},

    -- Grep project root and search files
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        }
                    }
                }
            })

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		end,
    },

    -- LSP
    -- Load order here is important
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "ansiblels",
                "dockerls",
                "docker_compose_language_service",
                "vimls",
            },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    }
}

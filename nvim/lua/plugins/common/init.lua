return {
	"tpope/vim-surround",

    -- Fast navigation with "s/S"
	{
		"ggandor/leap.nvim",
		config = function()
            vim.keymap.set('n', 's',  '<Plug>(leap-forward)')
            vim.keymap.set('n', 'S',  '<Plug>(leap-backward)')
            vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)')
		end
	},

}


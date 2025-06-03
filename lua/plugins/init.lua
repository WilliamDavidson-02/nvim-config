return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
	},

	{
		'projekt0n/github-nvim-theme',
		name = 'github-theme',
		lazy = false,
		priority = 1000,
		config = function()
			require('github-theme').setup({
				options = {
					transparent = true,
				}
			})

			vim.cmd('colorscheme github_dark_default')

			-- 💡 Forcefully clear background if needed
			vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
			vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE]])
			vim.cmd([[highlight NormalFloat guibg=NONE ctermbg=NONE]])
			vim.cmd([[highlight FloatBorder guibg=NONE ctermbg=NONE]])
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "javascript", "typescript", "html", "css" }, -- choose your languages
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true, -- enables syntax highlighting
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},

	{
		'numToStr/Comment.nvim',
	},

	{
		"mason-org/mason.nvim",
		opts = {}
	},

	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim", -- required dependency
		},
		config = function()
			require("config.none-ls")
		end,
	},

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    }
}


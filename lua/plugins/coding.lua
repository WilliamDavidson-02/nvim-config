return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    {
        "mg979/vim-visual-multi",
        branch = "master"
    },

    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    }

}

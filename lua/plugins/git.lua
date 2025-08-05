return {
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewFileHistory",
        },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("diffview").setup({
                enhanced_diff_hl = true,
                view = {
                    default = {
                        layout = "diff2_horizontal",
                    },
                },
                file_panel = {
                    listing_style = "tree",
                    win_config = {
                        position = "right",
                        width = 35,
                    },
                },
            })
        end,
    },
}

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

    -- mason for managing LSPs
    {
        "mason-org/mason.nvim",
        config = true,
    },

    -- bridge mason to lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        config = true,
        dependencies = { "mason-org/mason.nvim" },
    },

    -- lsp config
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = function(_, bufnr)
                    local opts = { buffer = bufnr, desc = "LSP Hover" }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end,
            })
        end,
    },

    -- autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                },
            })
        end,
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
    },

    {
        "mg979/vim-visual-multi",
        branch = "master"
    },

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
            position = "left",
            width = 35,
          },
        },
      })
    end,
  },
}


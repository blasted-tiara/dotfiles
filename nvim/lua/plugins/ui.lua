return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                lsp = {
                    progress = { enabled = true },
                    signature = { enabled = true },
                    hover = { enabled = true },
                },
                presets = {
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = true,
                },
            }
        end,
        dependencies = {
            { "MunifTanjim/nui.nvim", lazy = true },
            {
                "rcarriga/nvim-notify",
                opts = {
                    stages = "fade_in_slide_out",
                    timeout = 3000,
                    render = "default",
                }
            },
        }
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            vim.cmd([[colorscheme dayfox]])
        end

    },
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        opts = {
            theme = "gruvbox",
            options = {
                disabled_filetypes = { statusline = { "NvimTree" }, winbar = { "NvimTree" } },
            }
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
}

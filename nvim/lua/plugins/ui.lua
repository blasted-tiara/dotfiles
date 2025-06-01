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
    }
}

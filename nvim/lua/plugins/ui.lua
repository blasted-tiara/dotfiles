return {
    { "folke/noice.nvim", event = "VeryLazy", opts = function() return { lsp = {
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
    -- Themezzz
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            -- vim.cmd([[colorscheme dayfox]])
        end

    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function ()
            vim.cmd([[colorscheme tokyonight-night]])
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        opts = {
            options = {
                theme = "papercolor_light",
                ignore_focus = { "NvimTree" },
            }
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'akinsho/bufferline.nvim',
        tag = 'v4.9.1',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        keys = {
            -- Switch tabs
            { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Tab" },
            { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Tab" },
            -- Tab manipulation
            { "<A-w>", function ()
                local buffer_id = vim.fn.bufnr()
                if buffer_id then
                    vim.cmd('BufferLineCycleNext')
                    vim.cmd('bdelete ' .. buffer_id)
                end
            end, { desc = 'Close current buffer and go next'} },
        },
        opts = {
            options = {
                separator_style = "slant",  -- Slanted separators for a modern look
                always_show_bufferline = true,  -- Always display the bufferline
                color_icons = true,  -- Enable colored icons
                diagnostics = "nvim_lsp",  -- Show diagnostics from LSP
                diagnostics_update_in_insert = false,  -- Update diagnostics in insert mode
                offsets = {
                    {
                        filetype = "NvimTree",  -- Offset for the NvimTree file explorer
                        -- text = "File Explorer",
                        -- text_align = "left",
                        -- separator = true,
                    },
                },
            }
        },
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require('tiny-inline-diagnostic').setup()
            vim.diagnostic.config({ virtual_text = false })
        end
    }
}

return {
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        opts = function()
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
            local cmp = require("cmp")
            local defaults = require("cmp.config.default")()
            local auto_select = true
            local kind_icons = {
                Array         = " ",
                Boolean       = "󰨙 ",
                Class         = " ",
                Codeium       = "󰘦 ",
                Color         = " ",
                Control       = " ",
                Collapsed     = " ",
                Constant      = "󰏿 ",
                Constructor   = " ",
                Copilot       = " ",
                Enum          = " ",
                EnumMember    = " ",
                Event         = " ",
                Field         = " ",
                File          = " ",
                Folder        = " ",
                Function      = "󰊕 ",
                Interface     = " ",
                Key           = " ",
                Keyword       = " ",
                Method        = "󰊕 ",
                Module        = " ",
                Namespace     = "󰦮 ",
                Null          = " ",
                Number        = "󰎠 ",
                Object        = " ",
                Operator      = " ",
                Package       = " ",
                Property      = " ",
                Reference     = " ",
                Snippet       = "󱄽 ",
                String        = " ",
                Struct        = "󰆼 ",
                Supermaven    = " ",
                TabNine       = "󰏚 ",
                Text          = " ",
                TypeParameter = " ",
                Unit          = " ",
                Value         = " ",
                Variable      = "󰀫 ",
            }

            return {
                completion = {
                    completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
                },
                preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select == true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "path" },
                }, {
                        { name = "buffer" },
                    }),
                formatting = {
                    format = function(entry, item)
                        if kind_icons[item.kind] then
                            item.kind = kind_icons[item.kind] .. item.kind
                        end

                        local widths = {
                            abbr = 40,
                            menu = 30,
                        }

                        for key, width in pairs(widths) do
                            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                            end
                        end

                        return item
                    end,
                },
                sorting = defaults.sorting,
            }
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "garymjr/nvim-snippets",
                opts = {
                    friendly_snippets = true,
                },
                dependencies = { "rafamadriz/friendly-snippets" },
            },
        },
        opts = function(_, opts)
            opts.snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            }
            table.insert(opts.sources, { name = "snippets" })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    }
}

return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- LSP on_attach function for document highlighting
            -- LSP keybindings setup via LspAttach autocmd
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    local bufnr = args.buf
                    local opts = { buffer = bufnr, noremap = true, silent = true }

                    -- Essential LSP keybindings
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)

                    -- Document highlighting if supported
                    if client and client.server_capabilities.documentHighlightProvider then
                        local group = vim.api.nvim_create_augroup("LSPDocumentHighlight", { clear = false })

                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = bufnr,
                            group = group,
                            callback = function()
                                vim.lsp.buf.document_highlight()
                            end,
                        })

                        vim.api.nvim_create_autocmd("CursorMoved", {
                            buffer = bufnr,
                            group = group,
                            callback = function()
                                vim.lsp.buf.clear_references()
                            end,
                        })

                        vim.api.nvim_create_autocmd("BufLeave", {
                            buffer = bufnr,
                            group = group,
                            callback = function()
                                vim.lsp.buf.clear_references()
                            end,
                        })
                    end
                end,
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = vim.split(package.path, ";"),
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })
            vim.lsp.enable('lua_ls')

            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            allTargets = true,
                        },
                        cargo = {
                            allTargets = true,
                            -- target = "all",
                            target = "wasm32-unknown-unknown",
                        },
                    },
                },
            })

            vim.lsp.enable('rust_analyzer')
        end,
    },
}

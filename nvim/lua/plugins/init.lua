return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            vim.keymap.set('n', '<leader>fp', function()
                require('telescope.builtin').planets({
                    show_pluto = true,
                    show_moon = true,
                })
            end, { desc = 'Telescope help tags' })
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                    side = "left",
                    preserve_window_proportions = true,
                },
                renderer = {
                    group_empty = true
                },
                filters = {
                    dotfiles = false
                },
                git = {
                    enable = true
                },
            })
            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>r", ":NvimTreeFocus<CR>", {noremap = true, silent = true})
        end,
    },
}


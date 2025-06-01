vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('config.lazy')

-- General editor settings
vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Colorscheme
vim.cmd.colorscheme("dayfox")

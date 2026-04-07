-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
-- vim.g.lazyvim_rust_diagnostics = "bacon-ls"
vim.opt.clipboard = ""
vim.g.snacks_animate = false

vim.o.diffopt = "vertical," .. vim.o.diffopt
vim.g.lazyvim_blink_main = true
vim.go.inccommand = "split"

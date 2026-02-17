-- Leader map
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>dr", vim.cmd.Ex)

-- Set options
o = vim.o

o.autoindent = true
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.hlsearch = true
o.number = true
o.wrap = false
o.relativenumber = true
o.ls = 2

-- Code Folding keymaps
o.foldcolumn = '1'
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

vim.keymap.set("n", "<leader>o", "zo")
vim.keymap.set("n", "<leader>c", "zc")

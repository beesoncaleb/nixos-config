local opt = vim.opt_local

opt.wrap = true
opt.linebreak = true

vim.keymap.set('n', 'j', 'gj', {buffer = true})
vim.keymap.set('n', 'k', 'gk', {buffer = true})

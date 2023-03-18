vim.g.tidal_target = "terminal"

vim.keymap.set("n", '<C-CR>', '<Plug>TidalParagraphSend')
vim.keymap.set("i", '<C-CR>', '<Plug>TidalParagraphSend')
vim.keymap.set("n", '<C-.>', ':TidalHush<CR>')
vim.keymap.set("i", '<C-.>', ':TidalHush<CR>')

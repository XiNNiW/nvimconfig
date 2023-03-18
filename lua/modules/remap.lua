vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- vim.keymap.set("n", "<C-h>", function() vim.api.nvim_command('wincmd H') end)
--
-- common undo mappings... made possible by kitty terminal intercepting keys for c-s-z
vim.keymap.set("n", "<C-z>", function() vim.api.nvim_command('undo') end)
vim.keymap.set("i", "<C-z>", function() vim.api.nvim_command('undo') end)
vim.keymap.set("n", "<C-S-Z>", function() vim.api.nvim_command('redo') end)
vim.keymap.set("i", "<C-S-Z>", function() vim.api.nvim_command('redo') end)

-- column edit
vim.keymap.set('n', '<leader>v', '<C-V>')

-- copy paste mappings
vim.api.nvim_set_keymap("n", "<c-c>", '"*y :let @+=@*<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<c-c>", '"*y :let @+=@*<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-v>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<c-v>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<c-v>", '<esc>"+pi<Right>', { noremap = true, silent = true })


vim.keymap.set("n", '<M-pagedown>', ':bn<CR>')
vim.keymap.set("n", '<M-pageup>', ':bp<CR>')
vim.keymap.set('n', '<M-C-down>', '<Esc><S-V>ypi<end>')
vim.keymap.set('i', '<M-C-down>', '<Esc><S-V>ypi<end>')
vim.keymap.set('n', '<C-x>', '<Esc><S-V>xi<up><end>')
vim.keymap.set('i', '<C-x>', '<Esc><S-V>xi<up><end>')
-- selectioni
--vim.keymap.set("i", "<S-left>", 'v<S-left>')
--vim.keymap.set("i", "<S-right>", 'v<S-right>')
--vim.keymap.set("i", '<C-backspace>', '<S-left>x<Esc>i')
-- lets test these mappings...
-- move lines in visual mode
vim.keymap.set("n", "<M-up>", "v:m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<M-down>", "v:m '>+1<CR>gv=gv")

-- sensible paste behavior
vim.keymap.set("x", "<leader>p", "\"_dp")

--custom find and replace
vim.api.nvim_create_user_command("FindAndReplace", function(opts)
    vim.api.nvim_command(string.format("cdo s/%s/%s", opts.fargs[1], opts.fargs[2]))
    vim.api.nvim_command("cfdo update")
end, { nargs = "*" })

-- custom and broken find/replace function
vim.api.nvim_set_keymap(
    "n",
    "<M-h>",
    ":FindAndReplace ",
    { noremap = true })

-- find key bindings
vim.keymap.set("n", "<C-f>", "/")
vim.keymap.set("i", "<C-f>", "<Esc>/")
vim.keymap.set("v", "<C-f>", "/")

-- terminal keybindings
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<C-j>", ":sp<CR><C-w><down>:resize 10<CR>:terminal<CR>")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- vim.keymap.set("n", "<C-h>", function() vim.api.nvim_command('wincmd H') end)
--

vim.keymap.set("n", "<C-z>", function() vim.api.nvim_command('undo') end)
vim.keymap.set("i", "<C-z>", function() vim.api.nvim_command('undo') end)
vim.keymap.set("n", "<C-S-Z>", function() vim.api.nvim_command('redo') end)
vim.keymap.set("i", "<C-S-Z>", function() vim.api.nvim_command('redo') end)

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


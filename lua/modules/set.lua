vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "

--vim.o.nocompatible = true
vim.cmd([[
set nocompatible
filetype plugin on
syntax on
set foldmethod=syntax
]])
vim.g.vimwiki_list = {
    {
        path= '~/Documents/garden',
        syntax= 'markdown',
        ext= '.md',
        auto_tags=1,
        custom_wiki2html= '~/Documents/garden/_scripts/wiki2html.sh',
        template_path= '~/Documents/garden/_scripts',
        auto_export= 1,
        template_ext='.html',
        template_default='markdown'
    }
}

vim.g.vimwiki_use_calendar = 1
vim.g.calendar_keys = {
    goto_next_month= '<S-Right>',
    goto_prev_month= '<S-Left>',
    goto_prev_year= '<S-Up>',
    goto_next_year= '<S-Down>'
}

vim.g.vimwiki_list = {
    {
        path= '~/Documents/garden',
        syntax= 'markdown',
        ext= '.md',
        auto_tags=1,
        custom_wiki2html= '~/Documents/garden/_scripts/wiki2html.sh',
        template_path= '~/Documents/garden/_scripts',
        auto_export= 1,
        template_ext='.html',
        template_default='markdown'
    }
}

vim.g.vimwiki_use_calendar = 1
vim.g.calendar_keys = {
    goto_next_month= '<S-Right>',
    goto_prev_month= '<S-Left>',
    goto_prev_year= '<S-Up>',
    goto_next_year= '<S-Down>'
}


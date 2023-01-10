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



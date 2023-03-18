local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr



scnvim.setup {
    keymaps = {
        ['<M-CR>'] = map('editor.send_line', { 'i', 'n' }),
        ['<C-CR>'] = {
            map('editor.send_block', { 'i', 'n' }),
            map('editor.send_selection', 'x'),
        },
        ['<leader>p'] = map('postwin.toggle'),
        ['<C-p>'] = map('postwin.toggle', 'i'),
        ['<C-L>'] = map('postwin.clear', { 'n', 'i' }),
        ['<C-k>'] = map('signature.show', { 'n', 'i' }),
        ['<C-.>'] = map('sclang.hard_stop', { 'n', 'x', 'i' }),
        ['<leader><F1>'] = map('sclang.start'),
        ['<leader>rr'] = map('sclang.recompile'),
        ['<M-b>'] = map_expr('s.boot'),
        ['<F3>'] = map_expr('s.meter'),
    },
    editor = {
        highlight = {
            color = 'IncSearch',
        },
    },
    postwin = {
        float = {
            enabled = true,
        },
    },
}

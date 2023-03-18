local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace({
    library = vim.api.nvim_get_runtime_file('', true)
})
--lsp.preset('per-project')
lsp.ensure_installed({
    'eslint',
    'sumneko_lua',
    'rust_analyzer'
})
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-Space>"] = cmp.mapping.complete(),
})

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_format_on_save = function(bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end,
    })
end


lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workpace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "d]", function() vim.diagnostic.goto_prev() end, opts)

    vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>gdd", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)

    lsp_format_on_save(bufnr)
end)

local root_pattern = require('lspconfig').util.root_pattern
local function hls_root_pattern(filepath)
    return (
        root_pattern('hie.yaml', 'stack.yaml', 'cabal.project')(filepath)
            or root_pattern('*.cabal', 'package.yaml')(filepath)
            or root_pattern('BootTidal.hs')(filepath)
        )
end

lsp.configure("hls", {
    force_setup = true,
    filetypes = { "hs", "haskell", "lhaskell", "tidal" },
    rootdir = hls_root_pattern
})
lsp.configure("arduino-language-server", {
    filetypes = { "cpp" }
})
--lsp.configure("hls", {
--})
lsp.setup()

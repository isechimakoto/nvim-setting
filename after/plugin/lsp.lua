local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'lua_ls',
    'rust_analyzer',
})

lsp.configure('pyright', {
  single_file_support = false,
})

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>lS", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
    -- vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    vim.keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>", opts)
    vim.keymap.set({ "n", "v" }, "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)
    vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", opts)
    vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    vim.keymap.set("n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set("n", "<leader>[e", function()
      require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, opts)
    vim.keymap.set("n", "<leader>]e", function()
      require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, opts)
    -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

end)
lsp.setup()

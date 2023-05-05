-- Add bun for Node.js-based servers
local lspconfig_util = require "lspconfig.util"
local add_bun_prefix = require("plugins.lsp.bun").add_bun_prefix
lspconfig_util.on_setup = lspconfig_util.add_hook_before(lspconfig_util.on_setup, add_bun_prefix)

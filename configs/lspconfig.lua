local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
local servers = { "html", "cssls", "clangd", "lua_ls", "omnisharp" }



for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


lspconfig.gdscript.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  }
}

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
local servers = { "html", "cssls", "clangd", "lua_ls", "omnisharp", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.gdscript.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {'ncat', 'localhost', '6005'},
}

lspconfig.eslint.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})


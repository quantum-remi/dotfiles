require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd" } -- Ensures lua_ls is installed  
})
require("lspconfig").clangd.setup {}



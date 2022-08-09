local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify [[failed to load lspconfig.]]
  return
end

require "core.lsp.configs"
require("core.lsp.handlers").setup()

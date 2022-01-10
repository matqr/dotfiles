local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("theprimeagen.lsp.lsp-installer")
require("theprimeagen.lsp.handlers").setup()
require("theprimeagen.lsp.null-ls")

require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ruby_lsp", "emmet_ls" }
-- vim.lsp.enable(servers)
--
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {})
end

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

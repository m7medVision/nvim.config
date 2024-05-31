if vim.g.vscode then
  vim.lsp.stop_client(vim.lsp.get_active_clients())
end


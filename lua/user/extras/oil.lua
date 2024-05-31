local M = {
  enabled = function()
    return not vim.g.vscode
  end,
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  require("oil").setup {
    float = {
      max_height = 20,
      max_width = 60,
    },
  }
  if not vim.g.vscode then
      vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "_", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end
end

return M

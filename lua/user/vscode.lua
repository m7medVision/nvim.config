if vim.g.vscode then
  local vscode = require "vscode"
  vim.opt.swapfile = false
  vim.opt.undofile = true
  vim.opt.undolevels = 10000
  vim.opt.timeoutlen = 500
  vim.opt.shortmess = "oOtTWIcCFS"
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.scrolloff = 4
  vim.opt.sidescrolloff = 8
  vim.opt.virtualedit = "block"
  vim.opt.jumpoptions = "stack"
  vim.opt.expandtab = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.shiftround = true
  vim.opt.smartindent = true
  vim.opt.formatoptions = "tcrqjnl"
  vim.opt.clipboard = "unnamedplus"
  vim.cmd.syntax("off")
  local function esc()
    local key = vim.api.nvim_replace_termcodes("<esc>", true, true, true)
    vim.api.nvim_feedkeys(key, "n", false)
  end

  local k = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { expr = true }) -- expr is required
  end
  vim.opt.updatetime = 50

  -- LSP mappings
  vim.keymap.set("n", '<leader>gd', function() vscode.action("editor.action.revealDefinition") end, { desc = '[G]oto [D]efinition' })
  vim.keymap.set("n", '<leader>gi', function() vscode.action("editor.action.goToImplementation") end, { desc = '[G]oto [I]mplementation' })
  vim.keymap.set("n", '<leader>go', function() vscode.action("editor.action.goToTypeDefinition") end, { desc = 'Type Definition' })
  vim.keymap.set("n", '<leader>gr', function() vscode.action("editor.action.goToReferences") end, { desc = '[G]oto [R]eferences' })
  vim.keymap.set('n', '<leader>sf', function() vscode.action("workbench.action.quickOpen") end, { desc = "[S]earch [F]iles" })
  vim.keymap.set("n", "K", function() vscode.action("editor.action.marker.prev") end, { desc = "Hover Documentation" })
  vim.keymap.set('n', '<leader><leader>', function() vscode.action("workbench.action.quickOpenLeastRecentlyUsedEditor") end, { desc = "[S]earch [B]uffers" })
  vim.keymap.set("n", "<leader>`", function () vscode.action("workbench.view.explorer") end, { desc = "Explorer" })
  vim.keymap.set("n", "<leader>rn", function() vscode.action("editor.action.rename") end, { desc = "Rename" })
  vim.keymap.set('n', '<leader>we', function() vscode.action("workbench.action.toggleSidebarVisibility") end, { desc = "Window/Explorer toggle" })
  vim.keymap.set("n", "]d", function () vscode.action("editor.action.marker.next") end, { desc = "Next Diagnostic" })
  vim.keymap.set("n", "[d", function () vscode.action("editor.action.marker.prev") end, { desc = "Prev Diagnostic" })
  ------------
  -- Format --
  ------------
  local format = vscode.to_op(function(ctx)
    vscode.action("editor.action.formatSelection", { range = ctx.range, callback = esc })
  end)
  local format_line = function()
    return format() .. "_"
  end

  k({ "n", "x" }, "=", format)
  k({ "n" }, "==", format_line)
  -------------
  -- Comment --
  -------------
  local comment = vscode.to_op(function(ctx)
    local cmd = ctx.is_linewise and "editor.action.commentLine" or "editor.action.blockComment"
    local opts = { range = ctx.range, callback = esc }
    if ctx.is_linewise and ctx.is_current_line then
      opts.range = nil
    end
    vscode.action(cmd, opts)
  end)

  local comment_line = function()
    return comment() .. "_"
  end

  k({ "n", "x" }, "gc", comment)
  k({ "n" }, "gcc", comment_line)
end

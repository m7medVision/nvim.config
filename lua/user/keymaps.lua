local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-tab>", "<c-6>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)


keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)
keymap('n', '<A-Down>', ':m .+1<CR>==', opts)
keymap('n', '<A-Up>', ':m .-2<CR>==', opts)

keymap('x', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('x', '<A-k>', ":m '<-2<CR>gv=gv", opts)
keymap('x', '<A-Down>', ":m '>+1<CR>gv=gv", opts)
keymap('x', '<A-Up>', ":m '<-2<CR>gv=gv", opts)

keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
keymap('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', opts)
keymap('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', opts)
keymap("n", "<leader>q", ":q<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-s>', ':update<CR>', { noremap = true, silent = true })
keymap("n", "<leader>WQ", ":wq<CR>", opts)
keymap("n", "<leader>gg", "<cmd>Neogit<CR>", opts)
vim.keymap.set("n", "_", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- diagnostics
keymap("n", "]d", vim.diagnostic.get_next, opts)
keymap("n", "[d", vim.diagnostic.get_prev, opts)


-- Ignore highlight search
keymap("n", "<leader>\\", ":nohlsearch<CR>", opts)

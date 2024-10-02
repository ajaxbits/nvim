-- I can't be bothered figuring out what escape character bs is going on
-- in my nix config, so some keybinds that I blatantly copy from the internet
-- are going in here

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over without clobbering clipboard." })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selection or motion into the system clipboard." })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank current line into the system clipboard." })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete selection or motion without clobbering clipboard." })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Rename all instances of word under cursor within buffer" })

-- Navigate between windows using Ctrl + h/j/k/l
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Navigate between buffers
vim.api.nvim_set_keymap('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>lt", require("oil").open, { desc = "Open parent directory" })

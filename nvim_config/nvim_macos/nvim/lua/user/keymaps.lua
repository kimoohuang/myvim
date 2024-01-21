local keymap = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}
vim.keymap.set('n', "<leader>t", ":Neotree<CR>", opts)
vim.keymap.set('n', "<leader>s", ":SymbolsOutline<CR>", opts)
vim.keymap.set('n', "<leader>f", ":MRU<CR>", opts)
vim.keymap.set('n', "<leader>q", ":qa!<CR>", opts)
vim.keymap.set('n', "<leader>w", ":wa!<CR>", opts)
vim.keymap.set('i', "jj", "<ESC>", opts)
vim.keymap.set('n', "<space>", ":", opts)

vim.g.mapleader = " "

-- move lines
vim.keymap.set('n', '<A-k>', ':move -2<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', ':move +1<CR>==', { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('i', '<A-k>', '<Esc>:move -2<CR>==gi', { noremap = true, silent = true })
vim.keymap.set('i', '<A-j>', '<Esc>:move +1<CR>==gi', { noremap = true, silent = true })


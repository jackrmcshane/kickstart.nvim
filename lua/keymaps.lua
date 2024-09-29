-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
local set = vim.keymap.set
local opts = { noremap = true, silent = true }

-- [[ Normal ]]
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- NOTE: may want to find a more intuitive filetree explorer/editor
set('n', '<c-e>', vim.cmd.Ex, { desc = 'Open filetree explorer' })

-- global search and replace for the word you are on
set('n', '<c-s>', [[:%s//g<Left><Left>]])

-- Make U opposite to u.
set('n', 'U', '<C-r>', { desc = 'Redo' })

-- see https://stackoverflow.com/a/16136133/6064933
set('n', '<leader>o', "printf('m`%so<ESC>``', v:count1)", { expr = true, desc = 'insert line below without entering insert mode' })
set('n', '<leader>O', "printf('m`%sO<ESC>``', v:count1)", { expr = true, desc = 'insert line above without entering insert mode' })

-- Diagnostic keymaps
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
set('n', '[q', '<cmd>cprev<cr>zvzz', { desc = 'Previous quickfix item' })
set('n', ']q', '<cmd>cnext<cr>zvzz', { desc = 'Next quickfix item' })
set('n', '[l', '<cmd>lprev<cr>zvzz', { desc = 'Previous loclist item' })
set('n', ']l', '<cmd>lnext<cr>zvzz', { desc = 'Next loclist item' })

-- Center cursor on screen after these jumps/commands
set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half-page downwards' })
set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half-page upwards' })
set('n', 'n', 'nzzzv', { desc = 'Next search result' })
set('n', 'N', 'Nzzzv', { desc = 'Previous search result' })
set('n', 'J', 'mzJ`z', { desc = 'Concat lines' })
set('n', 'zj', 'zjzz', { desc = 'Jump to next fold' })
set('n', 'zk', 'zkzz', { desc = 'Jump to prev fold' })
set('n', 'zo', 'zozz', { desc = 'Open fold under cursor' })
set('n', 'zc', 'zCzz', { desc = 'Close fold under cursor' })

-- Change text without putting it into the vim register,
-- see https://stackoverflow.com/q/54255/6064933
set('n', 'c', '"_c', { desc = 'Change' })
set('n', 'C', '"_C', { desc = 'Change to EOL' })
set('n', 'cc', '"_cc', { desc = 'Change logical line' })

set('n', 'Y', 'yg$', { desc = 'Yank to EOL' })

-- [[ Visual ]]

-- better tabbing
set('v', '<', '<gv', { noremap = true, silent = true, desc = 'Hold visual selection after tabshift' })
set('v', '>', '>gv', { noremap = true, silent = true, desc = 'Hold visual selection after tabshift' })

set('v', '.', ':normal .<CR>', { desc = 'Repeat last normal mode op on visual selection' })
set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visual selection up in file' })
set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visual selection down in file' })

-- [[ Insert ]]

-- Break inserted text into smaller undo units when we insert some punctuation chars.
local undo_ch = { ',', '.', '!', '?', ';', ':' }
for _, ch in ipairs(undo_ch) do
  set('i', ch, ch .. '<c-g>u')
end

-- [[ Terminal ]]

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- [[ Command ]]

-- allows for preserving copied register
set('x', 'p', '"_dP')
set('x', 'c', '"_c')

-- Execute macro over a visual region.
vim.keymap.set('x', '@', function()
  return ':norm @' .. vim.fn.getcharstr() .. '<cr>'
end, { expr = true })

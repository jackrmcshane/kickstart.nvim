-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('jamcshan/StopNewLineComments', { clear = true }),
  desc = 'Stop new line comments for ALL filetypes',
  pattern = '*',
  callback = function(args)
    vim.cmd 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('jamcshan/RemoveTrailingWhitespace', { clear = true }),
  desc = 'Remove trailing whitespace on write',
  pattern = '*',
  callback = function(args)
    local save_cursor = vim.fn.getpos '.'
    pcall(function()
      vim.cmd [[ %s/\s\+$//e ]]
    end)
    pcall(function()
      vim.cmd [[ %s/\n\+\$//e ]]
    end)
    vim.fn.setpos('.', save_cursor)
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.api.nvim_create_augroup('mariasolos/last_location', { clear = true }),
  desc = 'Go to the last location when opening a buffer',
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd 'normal! g`"zz'
    end
  end,
})

-- Toggle relative linenumbers on while in a buffer
local line_numbers_group = vim.api.nvim_create_augroup('mariasolos/toggle_line_numbers', {})
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' }, {
  group = line_numbers_group,
  desc = 'Toggle relative line numbers on',
  callback = function()
    if vim.wo.nu and not vim.startswith(vim.api.nvim_get_mode().mode, 'i') then
      vim.wo.relativenumber = true
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' }, {
  group = line_numbers_group,
  desc = 'Toggle relative line numbers off',
  callback = function(args)
    if vim.wo.nu then
      vim.wo.relativenumber = false
    end

    -- Redraw here to avoid having to first write something for the line numbers to update.
    if args.event == 'CmdlineEnter' then
      vim.cmd.redraw()
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('mariasolos/close_with_q', { clear = true }),
  desc = 'Close with <q>',
  pattern = {
    'git',
    'help',
    'man',
    'qf',
    'query',
    'scratch',
  },
  callback = function(args)
    vim.keymap.set('n', 'q', '<cmd>quit<cr>', { buffer = args.buf })
  end,
})

vim.api.nvim_create_autocmd('CmdwinEnter', {
  group = vim.api.nvim_create_augroup('mariasolos/execute_cmd_and_stay', { clear = true }),
  desc = 'Execute command and stay in the command-line window',
  callback = function(args)
    vim.keymap.set({ 'n', 'i' }, '<S-CR>', '<cr>q:', { buffer = args.buf })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('jamcshan/Makefile', { clear = true }),
  desc = 'Disable expandtab for Makefiles',
  pattern = 'make',
  callback = function(args)
    vim.o.expandtab = false
  end,
})

-- Treesitter folding
-- TODO: comment this out for now, I'm pretty sick of folding atm
-- vim.api.nvim_create_autocmd('FileType', {
--   group = vim.api.nvim_create_augroup('mariasolos/treesitter_folding', { clear = true }),
--   desc = 'Enable Treesitter folding',
--   callback = function(args)
--     local bufnr = args.buf
--
--     -- Because of perf, just use indentation for folding in huge files.
--     local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
--     if not ok or not stats or stats.size > (250 * 1024) then
--       vim.wo[0][0].foldmethod = 'indent'
--       return
--     end
--
--     -- Check that Treesitter works.
--     if not pcall(vim.treesitter.start, bufnr) then
--       return
--     end
--
--     -- Enable Treesitter folding.
--     vim.api.nvim_buf_call(bufnr, function()
--       vim.wo[0][0].foldmethod = 'expr'
--       vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--       vim.cmd.normal 'zx'
--     end)
--   end,
-- })

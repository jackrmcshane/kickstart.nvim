local opts = {
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end

local key_opts = { noremap = true, silent = true }
if vim.fn.executable 'AsyncRun' == 1 then
  vim.keymap.set('n', '<F9>', ':<C-U>AsyncRun python3 -u "%"<CR>', key_opts)
end

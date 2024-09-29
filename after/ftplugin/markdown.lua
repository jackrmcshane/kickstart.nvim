-- TODO: add automatic calls to :MarkdownPreview

local set = vim.keymap.set
local opts = {
  wrap = true,
  updatetime = 3, -- "live" updating for preview
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end

local key_opts = { noremap = true, silent = true }
if vim.fn.executable("MarkdownPreviewToggle") == 1 then
  set("n", "<F9>", ":MarkdownPreviewToggle<CR>", key_opts)
end

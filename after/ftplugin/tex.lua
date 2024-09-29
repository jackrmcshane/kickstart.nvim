local opts = {
  wrap = true,
  updatetime = 3, -- "live" updating for preview
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end

vim.keymap.set("n", "<leader>c", "<cmd>VimtexCompile<cr>", { desc = "Compile LaTeX document." })

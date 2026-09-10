-- disable mouse
vim.opt.mouse = ""

-- enable lsp lines
vim.diagnostic.config({
  virtual_text = false, -- Disable normal error/warning lines
  virtual_lines = false, -- Enable virtual lines
  signs = false, -- Show signs in the sign column
  underline = true, -- Underline the problematic code
  update_in_insert = false, -- Don't update diagnostics in insert mode
})

-- Map 'jj' to Escape in Insert mode (i)
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Gitsigns diff
vim.keymap.set("n", "<leader>gd", function()
  if vim.g.gitsigns_diff_open then
    vim.cmd("tabclose")
    vim.g.gitsigns_diff_open = false
  else
    vim.cmd("Gitsigns diff")
    vim.g.gitsigns_diff_open = true
  end
end)

-- Gitsigns diffthis
vim.keymap.set("n", "<leader>gD", function()
  if vim.wo.diff then
    vim.cmd("diffoff!")
    vim.cmd("only")
  else
    vim.cmd("Gitsigns diffthis")
  end
end)

-- Close either diff with q
vim.keymap.set("n", "q", function()
  if vim.wo.diff then
    vim.cmd("diffoff!")
    vim.cmd("only")
  elseif vim.g.gitsigns_diff_open then
    vim.cmd("tabclose")
    vim.g.gitsigns_diff_open = false
  else
    vim.cmd("q")
  end
end)

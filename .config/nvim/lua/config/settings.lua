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

vim.keymap.set("n", "hh", "zz", {
  desc = "Center cursor",
  nowait = true,
})

vim.keymap.set("n", "ht", "zt", {
  desc = "Cursor to top",
  nowait = true,
})

vim.keymap.set("n", "hb", "zb", {
  desc = "Cursor to bottom",
  nowait = true,
})

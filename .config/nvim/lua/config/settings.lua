-- disable mouse
vim.opt.mouse = ""

-- enable lsp lines
vim.diagnostic.config({
  virtual_text = false, -- Disable normal error/warning lines
  virtual_lines = true, -- Enable virtual lines
  signs = true, -- Show signs in the sign column
  underline = true, -- Underline the problematic code
  update_in_insert = false, -- Don't update diagnostics in insert mode
})

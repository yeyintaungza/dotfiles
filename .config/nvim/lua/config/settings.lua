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

vim.opt.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  pattern = "*",
  command = "checktime",
})

-- Gitsigns diff: toggle
vim.keymap.set("n", "<leader>gd", function()
  if vim.wo.diff then
    vim.cmd("diffoff!")
    vim.cmd("tabclose")
  else
    vim.cmd("Gitsigns diff")
  end
end, { desc = "Git diff the dir " })

-- Gitsigns diffthis: toggle
vim.keymap.set("n", "<leader>gD", function()
  if vim.wo.diff then
    vim.cmd("diffoff!")
    vim.cmd("only")
  else
    vim.cmd("Gitsigns diffthis")
  end
end, { desc = "Git diff the current file " })

-- Close either diff with q
vim.keymap.set("n", "q", function()
  if vim.wo.diff then
    vim.cmd("diffoff!")

    -- Gitsigns diff uses a separate tab
    if #vim.api.nvim_list_tabpages() > 1 then
      vim.cmd("tabclose")
    else
      vim.cmd("only")
    end
  else
    vim.cmd("q")
  end
end)

vim.keymap.set("n", "<leader>fy", function()
  local rel_path = vim.fn.expand("%:.")
  vim.fn.setreg("+", rel_path)
  vim.notify("Copied relative path: " .. rel_path)
end, { desc = "Copy relative file path" })

-- better scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

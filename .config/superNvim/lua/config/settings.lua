vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

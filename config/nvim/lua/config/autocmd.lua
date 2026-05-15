local augroup = vim.api.nvim_create_augroup("MinimalConfig", { clear = true })

-- Remove trailing spaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Force no auto-indentation for every file
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.opt_local.autoindent = false
    vim.opt_local.smartindent = false
    vim.opt_local.cindent = false
    vim.opt_local.indentexpr = ""
  end,
})

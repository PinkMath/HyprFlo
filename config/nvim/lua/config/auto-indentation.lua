local M = {}

function M.setup()
  -- default indentation
  vim.opt.expandtab = true
  vim.opt.smartindent = true
  vim.opt.autoindent = true

  -- language specific indentation
  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "html",
      "css",
      "json",
      "lua",
      "yaml"
    },
    callback = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "python",
      "c",
      "cpp",
      "java",
      "go",
      "rust"
    },
    callback = function()
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
    end,
  })

  -- auto reindent file on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
      local view = vim.fn.winsaveview()
      vim.cmd("silent! normal! gg=G")
      vim.fn.winrestview(view)
    end,
  })
end

return M

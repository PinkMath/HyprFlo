local M = {}

-- default indentation
local default = 4

-- language indentation map
local indent = {
  lua = 2,

  javascript = 2,
  typescript = 2,
  javascriptreact = 2,
  typescriptreact = 2,

  html = 2,
  css = 2,
  scss = 2,

  json = 2,
  yaml = 2,
  yml = 2,

  sh = 2,
  bash = 2,
  zsh = 2,

  python = 4,
  c = 4,
  cpp = 4,
  java = 4,
  go = 4,
  rust = 4,
}

local function set_indent(width)
  vim.opt_local.shiftwidth = width
  vim.opt_local.tabstop = width
  vim.opt_local.softtabstop = width
end

function M.setup()
  -- global defaults
  vim.opt.expandtab = true
  vim.opt.smartindent = true
  vim.opt.autoindent = true

  -- default width
  set_indent(default)

  local group = vim.api.nvim_create_augroup("AutoIndent", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(event)
      local ft = event.match
      local width = indent[ft] or default

      set_indent(width)

      -- language exceptions
      if ft == "go" then
        vim.opt_local.expandtab = false
      else
        vim.opt_local.expandtab = true
      end
    end,
  })
end

return M

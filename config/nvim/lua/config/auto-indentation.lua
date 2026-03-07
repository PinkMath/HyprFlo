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

  set_indent(default)

  vim.api.nvim_create_autocmd("FileType", {
    callback = function(event)
      local ft = event.match
      local width = indent[ft]

      if width then
        set_indent(width)
      else
        set_indent(default)
      end
    end,
  })
end

return M

local M = {}

-- default config
local default = {
  width = 4,
  expandtab = true,
}

-- language settings
local languages = {
  lua = { width = 2 },

  javascript = { width = 2 },
  typescript = { width = 2 },
  javascriptreact = { width = 2 },
  typescriptreact = { width = 2 },

  html = { width = 2 },
  css = { width = 2 },
  scss = { width = 2 },

  json = { width = 2 },
  yaml = { width = 2 },
  yml = { width = 2 },

  sh = { width = 2 },
  bash = { width = 2 },
  zsh = { width = 2 },

  python = { width = 4 },
  c = { width = 4 },
  cpp = { width = 4 },
  java = { width = 4 },

  go = {
    width = 4,
    expandtab = false,
  },

  rust = { width = 4 },
}

local function apply(opts)
  local width = opts.width or default.width

  vim.opt_local.shiftwidth = width
  vim.opt_local.tabstop = width
  vim.opt_local.softtabstop = width
  vim.opt_local.expandtab = opts.expandtab ~= false
end

function M.setup()
  -- global indentation behaviour
  vim.opt.expandtab = true
  vim.opt.smartindent = true
  vim.opt.autoindent = true
  vim.opt.smarttab = true
  vim.opt.shiftround = true

  local group = vim.api.nvim_create_augroup("AutoIndent", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(event)
      local ft = event.match
      local cfg = languages[ft] or default
      apply(cfg)
    end,
  })
end

return M

local options = {
  -- UI
  number = true,
  relativenumber = true,
  numberwidth = 4,
  cursorline = true,
  termguicolors = true,
  laststatus = 3,
  showmode = false,
  showcmd = false,
  ruler = false,
  title = true,
  signcolumn = "yes",

  -- Behavior
  mouse = "a",
  clipboard = "unnamedplus",
  history = 100,
  swapfile = false,
  backup = false,
  undofile = true,
  wrap = true,
  scrolloff = 8,
  splitkeep = "screen",

  -- Search
  hlsearch = true,
  ignorecase = true,
  smartcase = true,

  -- Tabs
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
  smarttab = false,

  -- Disable auto-indentation
  autoindent = false,
  smartindent = false,
  cindent = false,
  copyindent = false,
  preserveindent = false,
  breakindent = false,

  -- Folding
  foldmethod = "manual",
  foldlevel = 99,

  -- Markdown/conceal
  conceallevel = 0,

  -- Better completion menu
  completeopt = { "menu", "menuone", "noselect" },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Keep filetype plugins, but disable filetype indentation
vim.cmd("filetype plugin on")
vim.cmd("filetype indent off")

-- Extra safety: disable indent expression
vim.opt.indentexpr = ""

vim.diagnostic.config({
  signs = false,
  virtual_text = true,
  underline = true,
  update_in_insert = false,
})

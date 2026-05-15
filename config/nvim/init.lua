-- Minimal Fullstack PinkMath Neovim config

-- Auto-install vim-plug if missing
local data_dir = vim.fn.stdpath("data")
local plug_path = data_dir .. "/site/autoload/plug.vim"

if vim.fn.empty(vim.fn.glob(plug_path)) == 1 then
  vim.fn.system({
    "curl",
    "-fLo",
    plug_path,
    "--create-dirs",
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
  })

  vim.cmd("autocmd VimEnter * PlugInstall --sync | source $MYVIMRC")
end

vim.loader.enable()

local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- Core
Plug("nvim-lua/plenary.nvim")

-- Fuzzy finder
Plug("ibhagwan/fzf-lua")

-- Syntax highlighting
Plug("nvim-treesitter/nvim-treesitter")

-- Git
Plug("lewis6991/gitsigns.nvim")

-- Harpoon
Plug("ThePrimeagen/harpoon", { ["branch"] = "harpoon2" })

-- LSP
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")

-- Completion
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")

-- Theme
Plug("rebelot/kanagawa.nvim")

vim.call("plug#end")

require("config.options")
require("config.mappings")
require("config.autocmd")

require("plugins.fzf-lua")
require("plugins.treesitter")
require("plugins.gitsigns")
require("plugins.harpoon")
require("plugins.lsp")

vim.cmd("colorscheme kanagawa")

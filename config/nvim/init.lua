-- bread's neovim config
-- keymaps are in lua/config/mappings.lua
-- install a patched font & ensure your terminal supports glyphs
-- enjoy :D

-- auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
  vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  vim.o.runtimepath = vim.o.runtimepath
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.g.start_time = vim.fn.reltime()
vim.loader.enable() --  SPEEEEEEEEEEED 
vim.call('plug#begin')

Plug('theprimeagen/vim-be-good') --yay theprimeagen - vim
Plug('ThePrimeagen/harpoon', { ['branch'] = 'harpoon2' }) --yay theprimeagen
Plug('nvim-lua/plenary.nvim')
Plug('nvim-lualine/lualine.nvim') --statusline
Plug('nvim-tree/nvim-web-devicons') --pretty icons
Plug('folke/which-key.nvim') --mappings popup
Plug('nvim-treesitter/nvim-treesitter') --improved syntax
Plug('mfussenegger/nvim-lint') --async linter
Plug('windwp/nvim-autopairs') --autopairs 
Plug('lewis6991/gitsigns.nvim') --git
Plug('numToStr/Comment.nvim') --easier comments
Plug('norcalli/nvim-colorizer.lua') --color highlight
Plug('ibhagwan/fzf-lua') --fuzzy finder and grep
Plug('numToStr/FTerm.nvim') --floating terminal
Plug('ron-rs/ron.vim') --ron syntax highlighting
Plug('MeanderingProgrammer/render-markdown.nvim') --render md inline
Plug('emmanueltouzery/decisive.nvim') --view csv files
Plug('folke/twilight.nvim') --surrounding dim
-- LSP + autocompletion
Plug('neovim/nvim-lspconfig')          -- LSP servers
Plug('williamboman/mason.nvim')        -- Installer
Plug('williamboman/mason-lspconfig.nvim')
Plug('hrsh7th/nvim-cmp')               -- completion engine
Plug('hrsh7th/cmp-nvim-lsp')           -- LSP completion source
Plug('hrsh7th/cmp-buffer')             -- buffer words
Plug('hrsh7th/cmp-path')               -- filesystem paths
Plug('L3MON4D3/LuaSnip')               -- snippet engine
Plug('saadparwaiz1/cmp_luasnip')       -- snippet completions
-- Theme
Plug('craftzdog/solarized-osaka.nvim')
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' }) --colorscheme
Plug('ellisonleao/gruvbox.nvim', { ['as'] = 'gruvbox' }) --colorscheme 2
Plug('uZer/pywal16.nvim', { [ 'as' ] = 'pywal16' }) --or, pywal colorscheme
Plug('rose-pine/neovim', { [ 'as' ] = 'rose-pine' }) --theme rose-pine

vim.call('plug#end')

-- move config and plugin config to alternate files
require("config.theme")
require("config.mappings")
require("config.options")
require("config.autocmd")
require("config.auto-indentation").setup()

-- Plug
require("plugins.autopairs")
require("plugins.rose-pine-theme")
require("plugins.lsp")
require("plugins.colorizer")
require("plugins.colorscheme")
require("plugins.comment")
require("plugins.fzf-lua")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim-lint")
require("plugins.render-markdown")
require("plugins.treesitter")

vim.defer_fn(function() 
  --defer non-essential configs,
  --purely for experimental purposes:
  --this only makes a difference of +-10ms on initial startup
  require("plugins.autopairs")
  require("plugins.harpoon")
  require("plugins.fterm")
  require("plugins.treesitter")
  require("plugins.fzf-lua")
  require("plugins.twilight")
  require("plugins.which-key")
end, 100)

load_theme()

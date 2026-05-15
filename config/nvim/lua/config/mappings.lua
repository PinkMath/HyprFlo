vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, {
    noremap = true,
    silent = true,
    desc = desc,
  })
end

-- Basic
map("n", "<leader>w", ":w<CR>", "Save file")
map("n", "<Esc>", ":nohlsearch<CR>") --petty cool
map({"n", "v"}, "<C-d>", "<C-d>zz") --petty cool
map({"n", "v"}, "<C-u>", "<C-u>zz") --petty cool
map("v", "J", ":m '>+1<CR>gv=gv") --petty cool
map("v", "K", ":m '<-2<CR>gv=gv") --petty cool
map("n", "J", "mzJ`z") --petty cool
map("n", "n", "nzzzv") --petty cool
map("n", "N", "Nzzzv") --petty cool
map("n", "<C-a>", "ggVG") --select the whole code as a C-a lol

-- FZF
map("n", "<leader>f", function()
  require("fzf-lua").files()
end, "Find files")

map("n", "<leader>g", function()
  require("fzf-lua").live_grep()
end, "Live grep")

map("n", "<leader>b", function()
  require("fzf-lua").buffers()
end, "Find buffers")

-- LSP
map("n", "gd", vim.lsp.buf.definition, "Go to definition")
map("n", "K", vim.lsp.buf.hover, "Hover documentation")
map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
map("n", "<leader>d", vim.diagnostic.open_float, "Show diagnostic")

-- window
map("n", "ss", "<C-w>s") --window - split horizontal
map("n", "sv", "<C-w>v") --window - split vertical
map("n", "sh", "<C-w>h") --window - go to left
map("n", "sj", "<C-w>j") --window - go to down
map("n", "sk", "<C-w>k") --window - go to up
map("n", "sl", "<C-w>l") --window - go to right

-- misc
map("n", "<leader>P", ":PlugInstall<CR>") --vim-plug-install
map("n", "<leader>U", ":PlugUpdate<CR>") --vim-plug-update
map("n", "<leader>R", ":so %<CR>") --reload neovim config
map("n", "<leader>u", ':silent !xdg-open "<cWORD>" &<CR>') --open a url under cursor
map("n", "<leader>pv", ":Ex<CR>") --Buffer
map("n", "<leader>S", ":%s//g<Left><Left>") --replace all - dont replace ':' to ':', dont ask why


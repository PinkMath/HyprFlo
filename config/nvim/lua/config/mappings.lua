-- mappings, including plugins

local function map(m, k, v)
  vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- set leader
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- fzf and grep
map("n", "<leader>f", ":lua require('fzf-lua').files()<CR>") --search cwd
map("n", "<leader>Fh", ":lua require('fzf-lua').files({ cwd = '~/' })<CR>") --search home
map("n", "<leader>Fc", ":lua require('fzf-lua').files({ cwd = '~/.config' })<CR>") --search .config
map("n", "<leader>Fl", ":lua require('fzf-lua').files({ cwd = '~/.local/src' })<CR>") --search .local/src
map("n", "<leader>Ff", ":lua require('fzf-lua').files({ cwd = '..' })<CR>") --search above
map("n", "<leader>Fr", ":lua require('fzf-lua').resume()<CR>") --last search
map("n", "<leader>g", ":lua require('fzf-lua').grep()<CR>") --grep
map("n", "<leader>G", ":lua require('fzf-lua').grep_cword()<CR>") --grep word under cursor

-- window
map("n", "ss", "<C-w>s") --window - split horizontal
map("n", "sv", "<C-w>v") --window - split vertical
map("n", "sh", "<C-w>h") --window - go to left
map("n", "sj", "<C-w>j") --window - go to down
map("n", "sk", "<C-w>k") --window - go to up
map("n", "sl", "<C-w>l") --window - go to right

-- misc
map("n", "<leader>s", ":%s//g<Left><Left>") --replace all - dont replace ':' to ':', dont ask why
map("n", "<leader>ps", switch_theme) --cycle themes
map("n", "<leader>P", ":PlugInstall<CR>") --vim-plug-install
map("n", "<leader>U", ":PlugUpdate<CR>") --vim-plug-update
map("n", "<leader>z", ":lua require('FTerm').open()<CR>") --open term
map("n", "<leader>w", ":w<CR>") --write but one less key
map("n", "<leader>d", ":w ") --duplicate to new name
map("n", "<leader>x", ":!chmod +x %<CR>") --make a file executable
map("n", "<leader>mv", ":!mv % ") --move a file to a new dir
map("n", "<leader>R", ":so %<CR>") --reload neovim config
map("n", "<leader>u", ':silent !xdg-open "<cWORD>" &<CR>') --open a url under cursor
map("n", "<leader>W", ":set wrap!<CR>") --toggle wrap
map("n", "<leader>l", ":Twilight<CR>") --surrounding dim - FIRE
map("n", "<leader>pv", ":Ex<CR>") --Buffer

-- theprimeagen - cool
map("n", "<Esc>", ":nohlsearch<CR>") --petty cool
map({"n", "v"}, "<C-d>", "<C-d>zz") --petty cool
map({"n", "v"}, "<C-u>", "<C-u>zz") --petty cool

map("v", "J", ":m '>+1<CR>gv=gv") --petty cool
map("v", "K", ":m '<-2<CR>gv=gv") --petty cool

map("n", "J", "mzJ`z") --petty cool
map("n", "n", "nzzzv") --petty cool
map("n", "N", "Nzzzv") --petty cool
map("n", "<C-a>", "ggVG") --select the whole code as a C-a lol

map("n", "<leader>o", function()
  require("lint").try_lint()
end) -- trigger the linting

map("n", "<leader>nn", function() --toggle relative vs absolute line numbers
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.wo.number = true
  else
    vim.wo.relativenumber = true
  end
end)

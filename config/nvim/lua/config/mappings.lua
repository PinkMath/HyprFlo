-- mappings, including plugins

local function map(m, k, v)
	vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- set leader
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- fzf and grep
map("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>") --search cwd
map("n", "<leader>Fh", "<cmd>lua require('fzf-lua').files({ cwd = '~/' })<CR>") --search home
map("n", "<leader>Fc", "<cmd>lua require('fzf-lua').files({ cwd = '~/.config' })<CR>") --search .config
map("n", "<leader>Fl", "<cmd>lua require('fzf-lua').files({ cwd = '~/.local/src' })<CR>") --search .local/src
map("n", "<leader>Ff", "<cmd>lua require('fzf-lua').files({ cwd = '..' })<CR>") --search above
map("n", "<leader>Fr", "<cmd>lua require('fzf-lua').resume()<CR>") --last search
map("n", "<leader>g", "<cmd>lua require('fzf-lua').grep()<CR>") --grep
map("n", "<leader>G", "<cmd>lua require('fzf-lua').grep_cword()<CR>") --grep word under cursor

-- window
map("n", "ss", "<C-w>s") --window - split horizontal
map("n", "sv", "<C-w>v") --window - split vertical
map("n", "sh", "<C-w>h") --window - go to left
map("n", "sj", "<C-w>j") --window - go to down
map("n", "sk", "<C-w>k") --window - go to up
map("n", "sl", "<C-w>l") --window - go to right

-- misc
map("n", "<leader>s", "<cmd>%s//g<Left><Left>") --replace all
map("n", "<leader>ps", switch_theme) --cycle themes
map("n", "<leader>P", "<cmd>PlugInstall<CR>") --vim-plug-install
map("n", "<leader>U", "<cmd>PlugUpdate<CR>") --vim-plug-update
map("n", "<leader>z", "<cmd>lua require('FTerm').open()<CR>") --open term
map("n", "<leader>w", "<cmd>w<CR>") --write but one less key
map("n", "<leader>d", "<cmd>w ") --duplicate to new name
map("n", "<leader>x", "<cmd>!chmod +x %<CR>") --make a file executable
map("n", "<leader>mv", "<cmd>!mv % ") --move a file to a new dir
map("n", "<leader>R", "<cmd>so %<CR>") --reload neovim config
map("n", "<leader>u", '<cmd>silent !xdg-open "<cWORD>" &<CR>') --open a url under cursor
map("v", "<leader>i", "=gv") --auto indent
map("n", "<leader>W", "<cmd>set wrap!<CR>") --toggle wrap
map("n", "<leader>l", "<cmd>Twilight<CR>") --surrounding dim - FIRE
map("n", "<leader>pv", "<cmd>Ex<CR>") --Buffer

-- pretty cool
map("n", "<Esc>", "<cmd>nohlsearch<CR>") --petty cool
map("n", "<C-d>", "<C-d>zz") --petty cool
map("n", "<C-u>", "<C-u>zz") --petty cool
map("n", "n", "nzz") --petty cool
map("n", "N", "Nzz") --petty cool - 4times lol
map("n", "<C-a>", "ggVG") --select the whole code as a C-a lol

map("n", "<leader>nn", function() --toggle relative vs absolute line numbers
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = true
	else
		vim.wo.relativenumber = true
	end
end)
